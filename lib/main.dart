import 'package:flutter/material.dart';
import 'package:tasks/src/task_controller.dart';

import 'src/app.dart';
import 'src/task_service.dart';

final taskService = TaskService();
final taskController = TaskController(taskService);

void main() async {
  runApp(const TasksApp());
}
