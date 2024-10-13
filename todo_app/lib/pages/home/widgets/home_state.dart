import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/models/task.dart';

final taskListProvider =
    StateNotifierProvider<TaskListNotifier, List<Task>>((ref) {
  return TaskListNotifier();
});

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super([]) {
    _loadTasks();
  }

  final Box<Task> _taskBox = Hive.box<Task>('tasksBox');

  void _loadTasks() {
    state = _taskBox.values.toList();
  }

  void addTask(Task task) {
    _taskBox.add(task);
    state = [...state, task];
  }

  void toggleTaskStatus(String id) {
    final task = _taskBox.values.firstWhere((task) => task.id == id);
    final updatedTask =
        task.copyWith(status: !task.status, updatedAt: DateTime.now());
    task.status = !task.status;
    task.updatedAt = DateTime.now();
    _taskBox.put(task.key, updatedTask);
    state = [..._taskBox.values];
  }

  void toggleTaskFavourite(String id) {
    final task = _taskBox.values.firstWhere((task) => task.id == id);
    final updatedTask =
        task.copyWith(remove: !task.remove, updatedAt: DateTime.now());
    task.remove = !task.remove;
    task.updatedAt = DateTime.now();
    _taskBox.put(task.key, updatedTask);
    state = [..._taskBox.values];
  }

  void removeTask(String id) {
    final task = _taskBox.values.firstWhere((task) => task.id == id);
    _taskBox.delete(task.key);
    state = state.where((task) => task.id != id).toList();
  }

  void editTask({
    required String title,
    String? description,
    required String taskId,
  }) {
    final taskIndex = state.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      final updatedTask = state[taskIndex].copyWith(
        title: title,
        description: description,
        updatedAt: DateTime.now(),
      );
      _taskBox.put(state[taskIndex].key, updatedTask);
      state = [...state]..[taskIndex] = updatedTask;
    }
  }
}

final incompletedTaskProvider = Provider<List<Task>>((ref) {
  final tasks = ref.watch(taskListProvider);
  return tasks.where((task) => !task.status).toList();
});

final completedTaskProvider = Provider<List<Task>>((ref) {
  final tasks = ref.watch(taskListProvider);
  return tasks.where((task) => task.status).toList();
});

final selectedTaskProvider = Provider.family<Task, String>((ref, id) {
  final tasks = ref.watch(taskListProvider);
  return tasks.firstWhere((task) => task.id == id);
});
