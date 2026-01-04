import 'package:flutter/material.dart';

class CreateWorkoutDialog extends StatefulWidget {
  final Function(String name, String? description) onSave;

  const CreateWorkoutDialog({super.key, required this.onSave});

  @override
  State<CreateWorkoutDialog> createState() => _CreateWorkoutDialogState();
}

class _CreateWorkoutDialogState extends State<CreateWorkoutDialog> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Workout'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name *',
              hintText: 'e.g., Push Day, Leg Day',
            ),
            autofocus: true,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'Optional notes',
            ),
            maxLines: 2,
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
            if (_nameController.text.trim().isEmpty) return;
            widget.onSave(
              _nameController.text.trim(),
              _descriptionController.text.trim().isEmpty
                  ? null
                  : _descriptionController.text.trim(),
            );
          },
          child: const Text('Create'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
