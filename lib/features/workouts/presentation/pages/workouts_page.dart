import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/workout.dart';
import '../providers/workouts_provider.dart';
import '../providers/active_session_provider.dart';
import '../widgets/workout_card.dart';
import '../widgets/create_workout_dialog.dart';

class WorkoutsPage extends ConsumerWidget {
  const WorkoutsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutsAsync = ref.watch(workoutsNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('My Workouts')),
      body: workoutsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (workouts) => workouts.isEmpty
            ? const _EmptyState()
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  final workout = workouts[index];
                  return WorkoutCard(
                    workout: workout,
                    onTap: () => context.push('/workouts/${workout.id}'),
                    onStart: () => _startWorkout(context, ref, workout.id),
                    onDelete: () => _confirmDelete(context, ref, workout),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateDialog(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => CreateWorkoutDialog(
        onSave: (name, description) {
          ref
              .read(workoutsNotifierProvider.notifier)
              .createWorkout(name, description);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _startWorkout(BuildContext context, WidgetRef ref, int workoutId) async {
    await ref
        .read(activeSessionNotifierProvider.notifier)
        .startSession(workoutId);
    if (context.mounted) {
      context.push('/session/active');
    }
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Workout workout) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Workout?'),
        content: Text('Delete "${workout.name}"? This cannot be undone.'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              ref
                  .read(workoutsNotifierProvider.notifier)
                  .deleteWorkout(workout.id);
              Navigator.pop(context);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.fitness_center, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('No workouts yet',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          const Text('Tap + to create your first workout'),
        ],
      ),
    );
  }
}
