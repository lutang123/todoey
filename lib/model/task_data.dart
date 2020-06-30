//foundation isk part of material class, but to keep it light, we can just use part of the class
import 'package:flutter/foundation.dart';
import 'dart:collection';

class Task {
  Task({this.title});
  String title;

  bool isDone = false;

  void toggleDone() {
    isDone = !isDone;
  }
}

class TaskData extends ChangeNotifier {
  //we want to make this private so that we will not mistakenly add data
  //directly to the list without using TaskData
  final List<Task> _taskList = [];

  //we add this because if we make _taskList private, then we can not access in
  //other class, but sometimes we still want to use this list, so we make it
  //unmodifiable, this is not a ListView, this is just to view list
  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_taskList);
  }

  void addTaskData(String newTask) {
    final task = Task(title: newTask);
    _taskList.add(task);
    //important
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone(); //make it not done
    //important
    notifyListeners();
  }

  void deleteTask(Task task) {
    _taskList.remove(task);
    //important
    notifyListeners();
  }
}
