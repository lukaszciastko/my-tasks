import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tasks/main.dart';
import 'package:tasks/src/task_list_tile.dart';

import 'edit_task_view.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
      ),
      body: ListenableBuilder(
        listenable: taskController,
        builder: (context, _) {
          return ListView(
            children: [
              for (final task in taskController.tasksById.values) TaskListTile(task: task),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(EditTaskView.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
