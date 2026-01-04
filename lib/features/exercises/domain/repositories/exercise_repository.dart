import '../entities/exercise.dart';

abstract class ExerciseRepository {
  Future<List<Exercise>> getAllExercises();
  Future<List<Exercise>> getExercisesByMuscleGroup(String muscleGroup);
  Future<List<Exercise>> searchExercises(String query);
  Future<Exercise?> getExerciseById(int id);
  Future<int> createCustomExercise({
    required String name,
    required String muscleGroup,
    String? equipment,
    String? instructions,
  });
  Future<void> deleteCustomExercise(int id);
}
