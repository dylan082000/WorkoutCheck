import '../entities/workout.dart';
import '../entities/workout_session.dart';

abstract class WorkoutRepository {
  Future<List<Workout>> getAllWorkouts();
  Future<Workout?> getWorkoutById(int id);
  Future<int> createWorkout(String name, String? description);
  Future<void> updateWorkout(int id, String name, String? description);
  Future<void> deleteWorkout(int id);
  Future<void> addExerciseToWorkout(
      int workoutId, int exerciseId, int targetSets, int targetReps);
  Future<void> updateExerciseTargets(
      int workoutExerciseId, int targetSets, int targetReps);
  Future<void> removeExerciseFromWorkout(int workoutExerciseId);

  Future<WorkoutSession> startSession(int workoutId);
  Future<WorkoutSession?> getActiveSession();
  Future<WorkoutSession?> getSessionById(int id);
  Future<List<WorkoutSession>> getCompletedSessions();
  Future<void> completeSession(int sessionId, {String? notes});
  Future<void> cancelSession(int sessionId);

  Future<int> logSet(
      int sessionId, int exerciseId, int setNumber, int reps, double weight);
  Future<void> updateSet(int setId, int reps, double weight);
  Future<void> markSetComplete(int setId);
  Future<void> deleteSet(int setId);
}
