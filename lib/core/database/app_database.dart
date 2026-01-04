import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Workouts,
  WorkoutSessions,
  Exercises,
  WorkoutExercises,
  ExerciseSets,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _seedExercises();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
    );
  }

  Future<void> _seedExercises() async {
    final exercisesList = [
      ExercisesCompanion.insert(
        name: 'Bench Press',
        muscleGroup: 'Chest',
        equipment: const Value('Barbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Squat',
        muscleGroup: 'Legs',
        equipment: const Value('Barbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Deadlift',
        muscleGroup: 'Back',
        equipment: const Value('Barbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Overhead Press',
        muscleGroup: 'Shoulders',
        equipment: const Value('Barbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Barbell Row',
        muscleGroup: 'Back',
        equipment: const Value('Barbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Pull-up',
        muscleGroup: 'Back',
        equipment: const Value('Bodyweight'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Dumbbell Curl',
        muscleGroup: 'Biceps',
        equipment: const Value('Dumbbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Tricep Pushdown',
        muscleGroup: 'Triceps',
        equipment: const Value('Cable'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Leg Press',
        muscleGroup: 'Legs',
        equipment: const Value('Machine'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Lat Pulldown',
        muscleGroup: 'Back',
        equipment: const Value('Cable'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Dumbbell Shoulder Press',
        muscleGroup: 'Shoulders',
        equipment: const Value('Dumbbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Romanian Deadlift',
        muscleGroup: 'Hamstrings',
        equipment: const Value('Barbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Incline Bench Press',
        muscleGroup: 'Chest',
        equipment: const Value('Barbell'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Cable Fly',
        muscleGroup: 'Chest',
        equipment: const Value('Cable'),
        isSystemExercise: const Value(true),
      ),
      ExercisesCompanion.insert(
        name: 'Plank',
        muscleGroup: 'Core',
        equipment: const Value('Bodyweight'),
        isSystemExercise: const Value(true),
      ),
    ];
    await batch((batch) => batch.insertAll(exercises, exercisesList));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'workout_tracker.db'));
    return NativeDatabase.createInBackground(file);
  });
}
