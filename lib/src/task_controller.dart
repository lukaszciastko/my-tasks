import 'package:flutter/foundation.dart';
import 'package:tasks/src/task.dart';
import 'package:tasks/src/task_service.dart';

class TaskController with ChangeNotifier {
  TaskController(this.taskService) {
    refresh();
  }

  final TaskService taskService;

  final tasksById = <String, Task>{};

  Future<void> addTask(Task task) async {
    final newTask = await taskService.addTask(task);
    tasksById[newTask.id] = newTask;
    notifyListeners();
  }

  Future<void> toggleTask(String id) async {}

  Future<void> updateTask(Task task) async {
    final updatedTask = await taskService.updateTask(task);
    tasksById[updatedTask.id] = updatedTask;
    notifyListeners();
  }

  Future<void> removeTask(String id) async {
    final removed = await taskService.removeTask(id);
    if (removed) {
      tasksById.remove(id);
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    final tasks = await taskService.getTasks();
    tasksById.clear();
    for (final task in tasks) {
      tasksById[task.id] = task;
    }
    notifyListeners();
  }
}
