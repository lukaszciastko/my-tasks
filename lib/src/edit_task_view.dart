import 'package:flutter/material.dart';
import 'package:tasks/main.dart';
import 'package:tasks/src/task.dart';

class EditTaskView extends StatefulWidget {
  const EditTaskView({super.key});

  static const routeName = '/edit-task';

  @override
  State<EditTaskView> createState() => _EditTaskViewState();
}

class _EditTaskViewState extends State<EditTaskView> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  // The task to edit, if any. If null, we're creating a new task.
  Task? get task => ModalRoute.of(context)!.settings.arguments as Task?;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final task = this.task;
      if (task != null) {
        _nameController.text = task.title;
        _descriptionController.text = task.description;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final task = this.task;
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            ElevatedButton(
              onPressed: () {
                final editedTask = Task(
                  id: task?.id ?? UniqueKey().toString(),
                  title: _nameController.text,
                  description: _descriptionController.text,
                  completed: task?.completed ?? false,
                );
                if (task == null) {
                  taskController.addTask(editedTask);
                } else {
                  taskController.updateTask(editedTask);
                }
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
