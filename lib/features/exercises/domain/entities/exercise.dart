import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise.freezed.dart';

@freezed
class Exercise with _$Exercise {
  const factory Exercise({
    required int id,
    required String name,
    required String muscleGroup,
    String? equipment,
    String? instructions,
    @Default(false) bool isSystemExercise,
  }) = _Exercise;
}

class MuscleGroups {
  static const List<String> all = [
    'Chest',
    'Back',
    'Shoulders',
    'Biceps',
    'Triceps',
    'Legs',
    'Hamstrings',
    'Calves',
    'Core',
    'Forearms',
  ];
}
