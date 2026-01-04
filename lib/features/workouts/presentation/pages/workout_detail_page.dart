import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/repositories/workout_repository_provider.dart';
import '../../domain/entities/workout.dart';
import '../providers/workouts_provider.dart';
import '../providers/active_session_provider.dart';
import '../widgets/exercise_config_sheet.dart';

class WorkoutDetailPage extends ConsumerWidget {
  final int workoutId;

  const WorkoutDetailPage({super.key, required this.workoutId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutAsync = ref.watch(workoutDetailProvider(workoutId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/workouts'),
          tooltip: 'Back to Workouts',
        ),
        title: const Text('Workout Details'),
        centerTitle: true,
      ),
      body: workoutAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (workout) {
          if (workout == null) {
            return const Center(child: Text('Workout not found'));
          }
          return Column(
            children: [
              // Breadcrumb navigation
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: theme.colorScheme.surfaceContainerHighest.withAlpha(128),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => context.go('/workouts'),
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.fitness_center,
                              size: 14,
                              color: theme.colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Workouts',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 16,
                      color: Colors.grey[500],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          workout.name,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Workout header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.fitness_center,
                            color: theme.colorScheme.onPrimaryContainer,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                workout.name,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (workout.description != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  workout.description!,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Stats row
                    Row(
                      children: [
                        _StatChip(
                          icon: Icons.format_list_numbered,
                          label: '${workout.exercises.length} exercises',
                        ),
                        const SizedBox(width: 8),
                        _StatChip(
                          icon: Icons.repeat,
                          label: '${_totalSets(workout)} total sets',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              // Exercises section header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exercises',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    FilledButton.tonalIcon(
                      onPressed: () => context
                          .push('/exercises?select=true&workoutId=$workoutId'),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add Exercise'),
                    ),
                  ],
                ),
              ),
              // Exercises list
              Expanded(
                child: workout.exercises.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.list_alt_outlined,
                              size: 48,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'No exercises yet',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Tap "Add Exercise" to build your workout',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ReorderableListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: workout.exercises.length,
                        onReorder: (oldIndex, newIndex) {},
                        itemBuilder: (context, index) {
                          final exercise = workout.exercises[index];
                          return Card(
                            key: ValueKey(exercise.id),
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: theme.colorScheme.primaryContainer,
                                child: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: theme.colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(
                                exercise.exerciseName,
                                style: const TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: InkWell(
                                onTap: () => _editExerciseTargets(
                                  context,
                                  ref,
                                  exercise.id,
                                  exercise.exerciseName,
                                  exercise.targetSets,
                                  exercise.targetReps,
                                ),
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 2),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${exercise.targetSets} sets × ${exercise.targetReps} reps',
                                        style: TextStyle(
                                          color: theme.colorScheme.primary,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Icon(
                                        Icons.edit,
                                        size: 14,
                                        color: theme.colorScheme.primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.drag_handle,
                                      color: Colors.grey),
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline,
                                        color: Colors.red),
                                    onPressed: () =>
                                        _removeExercise(context, ref, exercise.id),
                                    tooltip: 'Remove exercise',
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: FilledButton.icon(
            onPressed: () => _startWorkout(context, ref),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('Start Workout'),
            style: FilledButton.styleFrom(
              minimumSize: const Size.fromHeight(54),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _totalSets(Workout workout) {
    return workout.exercises.fold<int>(0, (sum, e) => sum + e.targetSets);
  }

  void _removeExercise(BuildContext context, WidgetRef ref, int weId) async {
    await ref.read(workoutRepositoryProvider).removeExerciseFromWorkout(weId);
    ref.invalidate(workoutDetailProvider(workoutId));
  }

  void _editExerciseTargets(
    BuildContext context,
    WidgetRef ref,
    int weId,
    String exerciseName,
    int currentSets,
    int currentReps,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ExerciseConfigSheet(
        exerciseName: exerciseName,
        initialSets: currentSets,
        initialReps: currentReps,
        onConfirm: (sets, reps) async {
          await ref
              .read(workoutRepositoryProvider)
              .updateExerciseTargets(weId, sets, reps);
          ref.invalidate(workoutDetailProvider(workoutId));
        },
      ),
    );
  }

  void _startWorkout(BuildContext context, WidgetRef ref) async {
    await ref
        .read(activeSessionNotifierProvider.notifier)
        .startSession(workoutId);
    if (context.mounted) {
      context.go('/session/active');
    }
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _StatChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey[700]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
