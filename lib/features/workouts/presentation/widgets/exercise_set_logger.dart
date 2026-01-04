import 'package:flutter/material.dart';
import '../../domain/entities/workout_session.dart';

class ExerciseSetLogger extends StatefulWidget {
  final SessionExercise exercise;
  final Function(int setId) onSetComplete;
  final Function(int reps, double weight) onAddSet;
  final Function(int setId, int reps, double weight)? onUpdateSet;
  final Function(int setId)? onDeleteSet;

  const ExerciseSetLogger({
    super.key,
    required this.exercise,
    required this.onSetComplete,
    required this.onAddSet,
    this.onUpdateSet,
    this.onDeleteSet,
  });

  @override
  State<ExerciseSetLogger> createState() => _ExerciseSetLoggerState();
}

class _ExerciseSetLoggerState extends State<ExerciseSetLogger> {
  final _repsController = TextEditingController(text: '10');
  final _weightController = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.exercise.exerciseName,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 16),
          Expanded(
            child: widget.exercise.sets.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fitness_center,
                             size: 48,
                             color: Colors.grey[400]),
                        const SizedBox(height: 12),
                        Text('No sets logged yet',
                             style: TextStyle(color: Colors.grey[600])),
                        const SizedBox(height: 4),
                        Text('Add your first set below',
                             style: TextStyle(
                               color: Colors.grey[500],
                               fontSize: 12,
                             )),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.exercise.sets.length,
                    itemBuilder: (context, index) {
                      final set = widget.exercise.sets[index];
                      return _SetCard(
                        set: set,
                        onComplete: () => widget.onSetComplete(set.id),
                        onEdit: widget.onUpdateSet != null
                            ? () => _showEditDialog(set)
                            : null,
                        onDelete: widget.onDeleteSet != null
                            ? () => widget.onDeleteSet!(set.id)
                            : null,
                      );
                    },
                  ),
          ),
          const SizedBox(height: 8),
          _AddSetCard(
            repsController: _repsController,
            weightController: _weightController,
            onAddSet: () {
              final reps = int.tryParse(_repsController.text) ?? 0;
              final weight = double.tryParse(_weightController.text) ?? 0;
              widget.onAddSet(reps, weight);
            },
          ),
        ],
      ),
    );
  }

  void _showEditDialog(ExerciseSetLog set) {
    final repsController = TextEditingController(text: set.reps.toString());
    final weightController = TextEditingController(text: set.weight.toString());

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Set ${set.setNumber}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: repsController,
              decoration: const InputDecoration(
                labelText: 'Reps',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final reps = int.tryParse(repsController.text) ?? set.reps;
              final weight =
                  double.tryParse(weightController.text) ?? set.weight;
              widget.onUpdateSet!(set.id, reps, weight);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _repsController.dispose();
    _weightController.dispose();
    super.dispose();
  }
}

class _SetCard extends StatelessWidget {
  final ExerciseSetLog set;
  final VoidCallback onComplete;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const _SetCard({
    required this.set,
    required this.onComplete,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isCompleted = set.completed;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: isCompleted
          ? Colors.green.withAlpha(25)
          : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isCompleted ? Colors.green : Colors.grey[300],
          foregroundColor: Colors.white,
          child: Text('${set.setNumber}'),
        ),
        title: Text(
          '${set.reps} reps × ${set.weight} kg',
          style: TextStyle(
            fontWeight: isCompleted ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        subtitle: isCompleted
            ? Text('Completed',
                   style: TextStyle(color: Colors.green[700], fontSize: 12))
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (onEdit != null && !isCompleted)
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: onEdit,
                tooltip: 'Edit set',
              ),
            if (onDelete != null && !isCompleted)
              IconButton(
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                onPressed: onDelete,
                tooltip: 'Delete set',
              ),
            if (!isCompleted)
              IconButton(
                icon: const Icon(Icons.check_circle_outline, color: Colors.green),
                onPressed: onComplete,
                tooltip: 'Mark as complete',
              ),
            if (isCompleted)
              const Icon(Icons.check_circle, color: Colors.green),
          ],
        ),
      ),
    );
  }
}

class _AddSetCard extends StatelessWidget {
  final TextEditingController repsController;
  final TextEditingController weightController;
  final VoidCallback onAddSet;

  const _AddSetCard({
    required this.repsController,
    required this.weightController,
    required this.onAddSet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.add_circle_outline, size: 20),
                const SizedBox(width: 8),
                Text('Add Set',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        )),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: repsController,
                    decoration: const InputDecoration(
                      labelText: 'Reps',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: weightController,
                    decoration: const InputDecoration(
                      labelText: 'Weight (kg)',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onAddSet,
                icon: const Icon(Icons.add),
                label: const Text('Log Set'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
