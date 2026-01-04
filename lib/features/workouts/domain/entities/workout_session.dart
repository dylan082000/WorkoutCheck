import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_session.freezed.dart';

@freezed
class WorkoutSession with _$WorkoutSession {
  const factory WorkoutSession({
    required int id,
    required int workoutId,
    required String workoutName,
    required DateTime startedAt,
    DateTime? completedAt,
    String? notes,
    @Default([]) List<SessionExercise> exercises,
  }) = _WorkoutSession;
}

@freezed
class SessionExercise with _$SessionExercise {
  const factory SessionExercise({
    required int exerciseId,
    required String exerciseName,
    @Default([]) List<ExerciseSetLog> sets,
  }) = _SessionExercise;
}

@freezed
class ExerciseSetLog with _$ExerciseSetLog {
  const factory ExerciseSetLog({
    required int id,
    required int setNumber,
    required int reps,
    required double weight,
    required bool completed,
    DateTime? completedAt,
  }) = _ExerciseSetLog;
}
