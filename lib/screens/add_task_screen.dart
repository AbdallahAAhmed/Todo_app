import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    String? newTaskTitle;
    final taskData = Provider.of<TaskData>(context);

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlueAccent
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                controller: controller,
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              ElevatedButton(
                onPressed: (){
                  // Write some codes
                  // addTaskCallback(newTaskTitle);
                  // controller.clear();
                  taskData.addToList(newTaskTitle!);
                  Navigator.pop(context);
                },
                child: Text('Add'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
