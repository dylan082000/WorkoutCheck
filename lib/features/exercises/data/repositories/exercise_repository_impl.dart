import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart' hide Exercise;
import '../../domain/entities/exercise.dart';
import '../../domain/repositories/exercise_repository.dart';

// Type alias for Drift-generated Exercise class
typedef ExerciseRow = dynamic;

class ExerciseRepositoryImpl implements ExerciseRepository {
  final AppDatabase _db;

  ExerciseRepositoryImpl(this._db);

  @override
  Future<List<Exercise>> getAllExercises() async {
    final results = await (_db.select(_db.exercises)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
    return results.map(_toEntity).toList();
  }

  @override
  Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup) async {
    final results = await (_db.select(_db.exercises)
          ..where((t) => t.muscleGroup.equals(muscleGroup))
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
    return results.map(_toEntity).toList();
  }

  @override
  Future<List<Exercise>> searchExercises(String query) async {
    final results = await (_db.select(_db.exercises)
          ..where((t) => t.name.like('%$query%'))
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
    return results.map(_toEntity).toList();
  }

  @override
  Future<Exercise?> getExerciseById(int id) async {
    final result = await (_db.select(_db.exercises)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return result != null ? _toEntity(result) : null;
  }

  @override
  Future<int> createCustomExercise({
    required String name,
    required String muscleGroup,
    String? equipment,
    String? instructions,
  }) async {
    return _db.into(_db.exercises).insert(
          ExercisesCompanion.insert(
            name: name,
            muscleGroup: muscleGroup,
            equipment: Value(equipment),
            instructions: Value(instructions),
            isSystemExercise: const Value(false),
          ),
        );
  }

  @override
  Future<void> deleteCustomExercise(int id) async {
    await (_db.delete(_db.exercises)
          ..where((t) => t.id.equals(id) & t.isSystemExercise.equals(false)))
        .go();
  }

  Exercise _toEntity(ExerciseRow e) => Exercise(
        id: e.id,
        name: e.name,
        muscleGroup: e.muscleGroup,
        equipment: e.equipment,
        instructions: e.instructions,
        isSystemExercise: e.isSystemExercise,
      );
}
