import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart' hide Workout, WorkoutSession;
import '../../domain/entities/workout.dart';
import '../../domain/entities/workout_session.dart';
import '../../domain/repositories/workout_repository.dart';

// Type alias for Drift-generated WorkoutSession class
typedef WorkoutSessionRow = dynamic;

class WorkoutRepositoryImpl implements WorkoutRepository {
  final AppDatabase _db;

  WorkoutRepositoryImpl(this._db);

  @override
  Future<List<Workout>> getAllWorkouts() async {
    final workouts = await (_db.select(_db.workouts)
          ..orderBy([(t) => OrderingTerm.desc(t.createdAt)]))
        .get();
    return Future.wait(workouts.map((w) async {
      final exercises = await _getWorkoutExercises(w.id);
      return Workout(
        id: w.id,
        name: w.name,
        description: w.description,
        createdAt: w.createdAt,
        exercises: exercises,
      );
    }));
  }

  Future<List<WorkoutExerciseEntry>> _getWorkoutExercises(int workoutId) async {
    final query = _db.select(_db.workoutExercises).join([
      innerJoin(_db.exercises,
          _db.exercises.id.equalsExp(_db.workoutExercises.exerciseId)),
    ])
      ..where(_db.workoutExercises.workoutId.equals(workoutId))
      ..orderBy([OrderingTerm.asc(_db.workoutExercises.orderIndex)]);

    final results = await query.get();
    return results.map((row) {
      final we = row.readTable(_db.workoutExercises);
      final e = row.readTable(_db.exercises);
      return WorkoutExerciseEntry(
        id: we.id,
        exerciseId: e.id,
        exerciseName: e.name,
        orderIndex: we.orderIndex,
        targetSets: we.targetSets,
        targetReps: we.targetReps,
      );
    }).toList();
  }

  @override
  Future<Workout?> getWorkoutById(int id) async {
    final workout = await (_db.select(_db.workouts)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (workout == null) return null;
    final exercises = await _getWorkoutExercises(id);
    return Workout(
      id: workout.id,
      name: workout.name,
      description: workout.description,
      createdAt: workout.createdAt,
      exercises: exercises,
    );
  }

  @override
  Future<int> createWorkout(String name, String? description) async {
    return _db.into(_db.workouts).insert(
          WorkoutsCompanion.insert(name: name, description: Value(description)),
        );
  }

  @override
  Future<void> updateWorkout(int id, String name, String? description) async {
    await (_db.update(_db.workouts)..where((t) => t.id.equals(id))).write(
      WorkoutsCompanion(
        name: Value(name),
        description: Value(description),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteWorkout(int id) async {
    await (_db.delete(_db.workoutExercises)
          ..where((t) => t.workoutId.equals(id)))
        .go();
    await (_db.delete(_db.workouts)..where((t) => t.id.equals(id))).go();
  }

  @override
  Future<void> addExerciseToWorkout(
      int workoutId, int exerciseId, int targetSets, int targetReps) async {
    final maxOrder = await (_db.selectOnly(_db.workoutExercises)
          ..addColumns([_db.workoutExercises.orderIndex.max()])
          ..where(_db.workoutExercises.workoutId.equals(workoutId)))
        .map((row) => row.read(_db.workoutExercises.orderIndex.max()))
        .getSingleOrNull();

    await _db.into(_db.workoutExercises).insert(
          WorkoutExercisesCompanion.insert(
            workoutId: workoutId,
            exerciseId: exerciseId,
            orderIndex: (maxOrder ?? -1) + 1,
            targetSets: Value(targetSets),
            targetReps: Value(targetReps),
          ),
        );
  }

  @override
  Future<void> updateExerciseTargets(
      int workoutExerciseId, int targetSets, int targetReps) async {
    await (_db.update(_db.workoutExercises)
          ..where((t) => t.id.equals(workoutExerciseId)))
        .write(
      WorkoutExercisesCompanion(
        targetSets: Value(targetSets),
        targetReps: Value(targetReps),
      ),
    );
  }

  @override
  Future<void> removeExerciseFromWorkout(int workoutExerciseId) async {
    await (_db.delete(_db.workoutExercises)
          ..where((t) => t.id.equals(workoutExerciseId)))
        .go();
  }

  @override
  Future<WorkoutSession> startSession(int workoutId) async {
    final workout = await (_db.select(_db.workouts)
          ..where((t) => t.id.equals(workoutId)))
        .getSingle();

    final sessionId = await _db.into(_db.workoutSessions).insert(
          WorkoutSessionsCompanion.insert(
            workoutId: workoutId,
            startedAt: DateTime.now(),
          ),
        );

    final workoutExercises = await _getWorkoutExercises(workoutId);

    return WorkoutSession(
      id: sessionId,
      workoutId: workoutId,
      workoutName: workout.name,
      startedAt: DateTime.now(),
      exercises: workoutExercises
          .map((e) => SessionExercise(
                exerciseId: e.exerciseId,
                exerciseName: e.exerciseName,
              ))
          .toList(),
    );
  }

  @override
  Future<WorkoutSession?> getActiveSession() async {
    final session = await (_db.select(_db.workoutSessions)
          ..where((t) => t.completedAt.isNull())
          ..orderBy([(t) => OrderingTerm.desc(t.startedAt)])
          ..limit(1))
        .getSingleOrNull();

    if (session == null) return null;
    return _buildSession(session);
  }

  @override
  Future<WorkoutSession?> getSessionById(int id) async {
    final session = await (_db.select(_db.workoutSessions)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (session == null) return null;
    return _buildSession(session);
  }

  @override
  Future<List<WorkoutSession>> getCompletedSessions() async {
    final sessions = await (_db.select(_db.workoutSessions)
          ..where((t) => t.completedAt.isNotNull())
          ..orderBy([(t) => OrderingTerm.desc(t.completedAt)]))
        .get();
    final results = await Future.wait(sessions.map((s) => _buildSession(s)));
    // Filter out null sessions (where workout was deleted)
    return results.whereType<WorkoutSession>().toList();
  }

  Future<WorkoutSession?> _buildSession(WorkoutSessionRow session) async {
    final workout = await (_db.select(_db.workouts)
          ..where((t) => t.id.equals(session.workoutId)))
        .getSingleOrNull();

    // If workout was deleted, skip this session
    if (workout == null) return null;

    final setsQuery = _db.select(_db.exerciseSets).join([
      innerJoin(
          _db.exercises, _db.exercises.id.equalsExp(_db.exerciseSets.exerciseId)),
    ])
      ..where(_db.exerciseSets.sessionId.equals(session.id))
      ..orderBy([OrderingTerm.asc(_db.exerciseSets.setNumber)]);

    final setsResults = await setsQuery.get();

    final exerciseMap = <int, SessionExercise>{};
    for (final row in setsResults) {
      final set = row.readTable(_db.exerciseSets);
      final exercise = row.readTable(_db.exercises);

      if (!exerciseMap.containsKey(exercise.id)) {
        exerciseMap[exercise.id] = SessionExercise(
          exerciseId: exercise.id,
          exerciseName: exercise.name,
        );
      }

      final setLog = ExerciseSetLog(
        id: set.id,
        setNumber: set.setNumber,
        reps: set.reps,
        weight: set.weight,
        completed: set.completed,
        completedAt: set.completedAt,
      );

      exerciseMap[exercise.id] = exerciseMap[exercise.id]!
          .copyWith(sets: [...exerciseMap[exercise.id]!.sets, setLog]);
    }

    final workoutExercises = await _getWorkoutExercises(session.workoutId);
    final exercises = workoutExercises.map((we) {
      return exerciseMap[we.exerciseId] ??
          SessionExercise(
            exerciseId: we.exerciseId,
            exerciseName: we.exerciseName,
          );
    }).toList();

    return WorkoutSession(
      id: session.id,
      workoutId: session.workoutId,
      workoutName: workout.name,
      startedAt: session.startedAt,
      completedAt: session.completedAt,
      notes: session.notes,
      exercises: exercises,
    );
  }

  @override
  Future<void> completeSession(int sessionId, {String? notes}) async {
    await (_db.update(_db.workoutSessions)
          ..where((t) => t.id.equals(sessionId)))
        .write(
      WorkoutSessionsCompanion(
        completedAt: Value(DateTime.now()),
        notes: Value(notes),
      ),
    );
  }

  @override
  Future<void> cancelSession(int sessionId) async {
    await (_db.delete(_db.exerciseSets)
          ..where((t) => t.sessionId.equals(sessionId)))
        .go();
    await (_db.delete(_db.workoutSessions)
          ..where((t) => t.id.equals(sessionId)))
        .go();
  }

  @override
  Future<int> logSet(int sessionId, int exerciseId, int setNumber, int reps,
      double weight) async {
    return _db.into(_db.exerciseSets).insert(
          ExerciseSetsCompanion.insert(
            sessionId: sessionId,
            exerciseId: exerciseId,
            setNumber: setNumber,
            reps: reps,
            weight: weight,
          ),
        );
  }

  @override
  Future<void> updateSet(int setId, int reps, double weight) async {
    await (_db.update(_db.exerciseSets)..where((t) => t.id.equals(setId)))
        .write(
      ExerciseSetsCompanion(
        reps: Value(reps),
        weight: Value(weight),
      ),
    );
  }

  @override
  Future<void> markSetComplete(int setId) async {
    await (_db.update(_db.exerciseSets)..where((t) => t.id.equals(setId)))
        .write(
      ExerciseSetsCompanion(
        completed: const Value(true),
        completedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> deleteSet(int setId) async {
    await (_db.delete(_db.exerciseSets)..where((t) => t.id.equals(setId))).go();
  }
}
