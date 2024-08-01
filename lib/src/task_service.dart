import 'task.dart';

const kDelay = Duration(milliseconds: 500);

class TaskService {
  final _tasks = <Task>[
    Task(
      id: '1',
      title: 'Sample Task',
      description: 'This is a sample task.',
      completed: false,
    ),
    Task(
      id: '2',
      title: 'Another Task',
      description: 'This is another task.',
      completed: true,
    ),
  ];

  Future<List<Task>> getTasks() {
    return Future.delayed(kDelay, () {
      return List.unmodifiable(_tasks);
    });
  }

  Future<Task> addTask(Task task) {
    return Future.delayed(kDelay, () {
      if (_tasks.length >= 5) {
        throw Exception('Cannot add more than 10 tasks.');
      }
      _tasks.add(task);
      return task;
    });
  }

  Future<Task> updateTask(Task task) {
    return Future.delayed(kDelay, () {
      final index = _tasks.indexWhere((element) => element.id == task.id);
      if (index != -1) {
        _tasks[index] = task;
      }
      return task;
    });
  }

  Future<bool> removeTask(String id) {
    return Future.delayed(kDelay, () {
      final index = _tasks.indexWhere((element) => element.id == id);
      if (index != -1) {
        _tasks.removeAt(index);
        return true;
      }
      return false;
    });
  }
}
