import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../timer/presentation/widgets/rest_timer_sheet.dart';
import '../providers/active_session_provider.dart';
import '../widgets/exercise_set_logger.dart';

class ActiveSessionPage extends ConsumerStatefulWidget {
  const ActiveSessionPage({super.key});

  @override
  ConsumerState<ActiveSessionPage> createState() => _ActiveSessionPageState();
}

class _ActiveSessionPageState extends ConsumerState<ActiveSessionPage> {
  int _currentExerciseIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sessionAsync = ref.watch(activeSessionNotifierProvider);
    final theme = Theme.of(context);

    return sessionAsync.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (session) {
        if (session == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.go('/workouts');
          });
          return const SizedBox();
        }

        final exercises = session.exercises;
        final currentExercise =
            exercises.isNotEmpty && _currentExerciseIndex < exercises.length
                ? exercises[_currentExerciseIndex]
                : null;

        final completedSets = exercises.fold<int>(
          0,
          (sum, e) => sum + e.sets.where((s) => s.completed).length,
        );
        final totalSets = exercises.fold<int>(0, (sum, e) => sum + e.sets.length);
        final progress = totalSets > 0 ? completedSets / totalSets : 0.0;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => _showCancelDialog(context),
            ),
            title: Text(session.workoutName),
            centerTitle: true,
            actions: [
              TextButton.icon(
                onPressed: () => _completeWorkout(context),
                icon: const Icon(Icons.check),
                label: const Text('Finish'),
              ),
            ],
          ),
          body: Column(
            children: [
              // Progress indicator with percentage
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                color: theme.colorScheme.surfaceContainerHighest.withAlpha(128),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Progress: $completedSets/$totalSets sets',
                          style: theme.textTheme.bodySmall,
                        ),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ],
                ),
              ),
              // Exercise tabs
              if (exercises.isNotEmpty)
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: theme.colorScheme.outline.withAlpha(51),
                      ),
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      final isSelected = index == _currentExerciseIndex;
                      final completedCount =
                          exercise.sets.where((s) => s.completed).length;
                      final hasCompletedSets = completedCount > 0;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ChoiceChip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(exercise.exerciseName),
                              if (hasCompletedSets) ...[
                                const SizedBox(width: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '$completedCount',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          selected: isSelected,
                          onSelected: (_) =>
                              setState(() => _currentExerciseIndex = index),
                        ),
                      );
                    },
                  ),
                ),
              // Main content
              Expanded(
                child: currentExercise == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.fitness_center,
                                 size: 64,
                                 color: Colors.grey[400]),
                            const SizedBox(height: 16),
                            Text('No exercises in this workout',
                                 style: theme.textTheme.titleMedium?.copyWith(
                                   color: Colors.grey[600],
                                 )),
                            const SizedBox(height: 8),
                            Text('Add exercises from workout details',
                                 style: TextStyle(color: Colors.grey[500])),
                          ],
                        ),
                      )
                    : ExerciseSetLogger(
                        exercise: currentExercise,
                        onSetComplete: (setId) {
                          ref
                              .read(activeSessionNotifierProvider.notifier)
                              .markSetComplete(setId);
                          _showRestTimer(context);
                        },
                        onAddSet: (reps, weight) {
                          final setNumber = currentExercise.sets.length + 1;
                          ref
                              .read(activeSessionNotifierProvider.notifier)
                              .logSet(
                                exerciseId: currentExercise.exerciseId,
                                setNumber: setNumber,
                                reps: reps,
                                weight: weight,
                              );
                        },
                        onUpdateSet: (setId, reps, weight) {
                          ref
                              .read(activeSessionNotifierProvider.notifier)
                              .updateSet(setId, reps, weight);
                        },
                        onDeleteSet: (setId) {
                          ref
                              .read(activeSessionNotifierProvider.notifier)
                              .deleteSet(setId);
                        },
                      ),
              ),
            ],
          ),
          // Improved FAB with label
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => _showRestTimer(context),
            icon: const Icon(Icons.timer),
            label: const Text('Rest Timer'),
            backgroundColor: theme.colorScheme.secondary,
            foregroundColor: theme.colorScheme.onSecondary,
          ),
        );
      },
    );
  }

  void _showRestTimer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const RestTimerSheet(),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Workout?'),
        content: const Text('Your progress will not be saved.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue')),
          TextButton(
            onPressed: () {
              ref.read(activeSessionNotifierProvider.notifier).cancelSession();
              Navigator.pop(context);
              context.go('/workouts');
            },
            child: const Text('Cancel Workout',
                style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _completeWorkout(BuildContext context) async {
    await ref.read(activeSessionNotifierProvider.notifier).completeSession();
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Workout complete! Check your history.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      context.go('/workouts');
    }
  }
}
