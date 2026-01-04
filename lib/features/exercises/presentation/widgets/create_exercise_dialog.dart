import 'package:flutter/material.dart';
import '../../domain/entities/exercise.dart';

class CreateExerciseDialog extends StatefulWidget {
  final Function(
          String name, String muscleGroup, String? equipment, String? instructions)
      onSave;

  const CreateExerciseDialog({super.key, required this.onSave});

  @override
  State<CreateExerciseDialog> createState() => _CreateExerciseDialogState();
}

class _CreateExerciseDialogState extends State<CreateExerciseDialog> {
  final _nameController = TextEditingController();
  final _equipmentController = TextEditingController();
  final _instructionsController = TextEditingController();
  String _selectedMuscleGroup = MuscleGroups.all.first;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Exercise'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name *'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _selectedMuscleGroup,
              decoration: const InputDecoration(labelText: 'Muscle Group *'),
              items: MuscleGroups.all
                  .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                  .toList(),
              onChanged: (v) => setState(() => _selectedMuscleGroup = v!),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _equipmentController,
              decoration: const InputDecoration(labelText: 'Equipment'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _instructionsController,
              decoration: const InputDecoration(labelText: 'Instructions'),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')),
        FilledButton(
          onPressed: () {
            if (_nameController.text.isEmpty) return;
            widget.onSave(
              _nameController.text,
              _selectedMuscleGroup,
              _equipmentController.text.isEmpty
                  ? null
                  : _equipmentController.text,
              _instructionsController.text.isEmpty
                  ? null
                  : _instructionsController.text,
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _equipmentController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }
}
