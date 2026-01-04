import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/exercise_repository_provider.dart';
import '../../domain/entities/exercise.dart';

part 'exercises_provider.g.dart';

@riverpod
class ExercisesNotifier extends _$ExercisesNotifier {
  String? _muscleGroupFilter;
  String? _searchQuery;

  @override
  Future<List<Exercise>> build() async {
    final repo = ref.watch(exerciseRepositoryProvider);
    if (_searchQuery != null && _searchQuery!.isNotEmpty) {
      return repo.searchExercises(_searchQuery!);
    }
    if (_muscleGroupFilter != null) {
      return repo.getExercisesByMuscleGroup(_muscleGroupFilter!);
    }
    return repo.getAllExercises();
  }

  void filterByMuscleGroup(String? muscleGroup) {
    _muscleGroupFilter = muscleGroup;
    _searchQuery = null;
    ref.invalidateSelf();
  }

  void search(String query) {
    _searchQuery = query;
    _muscleGroupFilter = null;
    ref.invalidateSelf();
  }

  void clearFilters() {
    _muscleGroupFilter = null;
    _searchQuery = null;
    ref.invalidateSelf();
  }

  Future<void> createExercise({
    required String name,
    required String muscleGroup,
    String? equipment,
    String? instructions,
  }) async {
    await ref.read(exerciseRepositoryProvider).createCustomExercise(
          name: name,
          muscleGroup: muscleGroup,
          equipment: equipment,
          instructions: instructions,
        );
    ref.invalidateSelf();
  }
}
