import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/widgets/taskstile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TasksTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback : (checkboxState) {
                  taskData.isFinished(task);
                },
                longPressCallback: () {
                  taskData.deleteFromList(task);
                },
              );
            },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}