import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/workout_repository_provider.dart';
import '../../domain/entities/workout.dart';

part 'workouts_provider.g.dart';

@riverpod
class WorkoutsNotifier extends _$WorkoutsNotifier {
  @override
  Future<List<Workout>> build() async {
    return ref.watch(workoutRepositoryProvider).getAllWorkouts();
  }

  Future<void> createWorkout(String name, String? description) async {
    await ref.read(workoutRepositoryProvider).createWorkout(name, description);
    ref.invalidateSelf();
  }

  Future<void> deleteWorkout(int id) async {
    await ref.read(workoutRepositoryProvider).deleteWorkout(id);
    ref.invalidateSelf();
  }
}

@riverpod
Future<Workout?> workoutDetail(WorkoutDetailRef ref, int id) async {
  return ref.watch(workoutRepositoryProvider).getWorkoutById(id);
}
