import 'package:flutter/material.dart';
import '../../domain/entities/exercise.dart';

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  const ExerciseTile({
    super.key,
    required this.exercise,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: _getMuscleGroupColor(exercise.muscleGroup),
        child: Text(
          exercise.muscleGroup[0],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      title: Text(exercise.name),
      subtitle: Text(exercise.equipment ?? 'Bodyweight'),
      trailing: exercise.isSystemExercise
          ? null
          : const Icon(Icons.person, size: 16, color: Colors.grey),
    );
  }

  Color _getMuscleGroupColor(String group) {
    final colors = {
      'Chest': Colors.red[400],
      'Back': Colors.blue[400],
      'Shoulders': Colors.orange[400],
      'Legs': Colors.green[400],
      'Biceps': Colors.purple[400],
      'Triceps': Colors.pink[400],
      'Core': Colors.teal[400],
      'Hamstrings': Colors.lime[600],
      'Calves': Colors.indigo[400],
      'Forearms': Colors.brown[400],
    };
    return colors[group] ?? Colors.grey[400]!;
  }
}
