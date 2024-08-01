import 'package:flutter/material.dart';
import 'package:tasks/src/task.dart';

import '../main.dart';
import 'edit_task_view.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      onTap: () {
        Navigator.of(context).pushNamed(EditTaskView.routeName, arguments: task);
      },
      trailing: Checkbox(
        value: task.completed,
        onChanged: (value) {
          taskController.toggleTask(task.id);
        },
      ),
    );
  }
}
