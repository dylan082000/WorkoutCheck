import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../workouts/data/repositories/workout_repository_provider.dart';
import '../../../workouts/presentation/providers/workouts_provider.dart';
import '../../../workouts/presentation/widgets/exercise_config_sheet.dart';
import '../../domain/entities/exercise.dart';
import '../providers/exercises_provider.dart';
import '../widgets/exercise_tile.dart';
import '../widgets/create_exercise_dialog.dart';

class ExerciseLibraryPage extends ConsumerStatefulWidget {
  final bool selectMode;
  final int? workoutId;

  const ExerciseLibraryPage({
    super.key,
    this.selectMode = false,
    this.workoutId,
  });

  @override
  ConsumerState<ExerciseLibraryPage> createState() =>
      _ExerciseLibraryPageState();
}

class _ExerciseLibraryPageState extends ConsumerState<ExerciseLibraryPage> {
  String? _selectedMuscleGroup;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final exercisesAsync = ref.watch(exercisesNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectMode ? 'Select Exercise' : 'Exercise Library'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search exercises...',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref
                              .read(exercisesNotifierProvider.notifier)
                              .clearFilters();
                        },
                      )
                    : null,
              ),
              onChanged: (value) {
                ref.read(exercisesNotifierProvider.notifier).search(value);
              },
            ),
          ),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: _selectedMuscleGroup == null,
                  onSelected: (_) {
                    setState(() => _selectedMuscleGroup = null);
                    ref
                        .read(exercisesNotifierProvider.notifier)
                        .clearFilters();
                  },
                ),
                const SizedBox(width: 8),
                ...MuscleGroups.all.map((group) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: FilterChip(
                        label: Text(group),
                        selected: _selectedMuscleGroup == group,
                        onSelected: (_) {
                          setState(() => _selectedMuscleGroup = group);
                          ref
                              .read(exercisesNotifierProvider.notifier)
                              .filterByMuscleGroup(group);
                        },
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: exercisesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (exercises) => exercises.isEmpty
                  ? const Center(child: Text('No exercises found'))
                  : ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = exercises[index];
                        return ExerciseTile(
                          exercise: exercise,
                          onTap: widget.selectMode
                              ? () => _selectExercise(exercise)
                              : () => _showExerciseDetails(exercise),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _selectExercise(Exercise exercise) {
    if (widget.workoutId != null) {
      // Show config sheet to let user configure sets/reps
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (sheetContext) => ExerciseConfigSheet(
          exerciseName: exercise.name,
          initialSets: 3,
          initialReps: 10,
          onConfirm: (sets, reps) async {
            await ref.read(workoutRepositoryProvider).addExerciseToWorkout(
                  widget.workoutId!,
                  exercise.id,
                  sets,
                  reps,
                );
            // Invalidate the workout detail provider to refresh the list
            ref.invalidate(workoutDetailProvider(widget.workoutId!));
            if (!mounted) return;
            context.pop(); // Close exercise library
          },
        ),
      );
    } else {
      context.pop();
    }
  }

  void _showExerciseDetails(Exercise exercise) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exercise.name,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Muscle Group: ${exercise.muscleGroup}'),
            if (exercise.equipment != null)
              Text('Equipment: ${exercise.equipment}'),
            if (exercise.instructions != null) ...[
              const SizedBox(height: 16),
              Text('Instructions:',
                  style: Theme.of(context).textTheme.titleMedium),
              Text(exercise.instructions!),
            ],
          ],
        ),
      ),
    );
  }

  void _showCreateDialog() {
    showDialog(
      context: context,
      builder: (context) => CreateExerciseDialog(
        onSave: (name, muscleGroup, equipment, instructions) {
          ref.read(exercisesNotifierProvider.notifier).createExercise(
                name: name,
                muscleGroup: muscleGroup,
                equipment: equipment,
                instructions: instructions,
              );
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
