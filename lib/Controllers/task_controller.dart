import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncday/Models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  var taskContrller = TextEditingController().obs;

  void addTask(String title) {
    final task = TaskModel(
      id: DateTime.now().toString(),
      title: title,
      isDone: false,
    );
    tasks.add(task);
  }

  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    tasks.refresh();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
  }
}
