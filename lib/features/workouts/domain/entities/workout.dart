import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout.freezed.dart';

@freezed
class Workout with _$Workout {
  const factory Workout({
    required int id,
    required String name,
    String? description,
    required DateTime createdAt,
    @Default([]) List<WorkoutExerciseEntry> exercises,
  }) = _Workout;
}

@freezed
class WorkoutExerciseEntry with _$WorkoutExerciseEntry {
  const factory WorkoutExerciseEntry({
    required int id,
    required int exerciseId,
    required String exerciseName,
    required int orderIndex,
    required int targetSets,
    required int targetReps,
  }) = _WorkoutExerciseEntry;
}
