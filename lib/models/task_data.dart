import 'package:flutter/foundation.dart';
import 'package:todo/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  List<Task> _tasks = [
    Task(name: 'Buy a Milk'),
    Task(name: 'Buy a eggs'),
    Task(name: 'Buy a bread'),
    Task(name: 'Buy a coffee'),
    Task(name: 'Buy a Beer'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addToList(String taskTitle) {
      final task = Task(name: taskTitle);
      _tasks.add(task);
      notifyListeners();
  }

  void deleteFromList(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void isFinished(Task task) {
      task.toggleDone();
      notifyListeners();
  }

  int get taskCount => _tasks.length;
}