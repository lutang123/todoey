import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoprovider/model/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//   //why here?  because we need to assign value to it so it can not
     //be marked as final
    // and if we put it up, it has to be final for StatelessWidget
    String newTaskTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                //should we make it false?? false is working properly
                //so we should make it false
                Provider.of<TaskData>(context, listen: false)
                    .addTaskData(newTaskTitle);
                Navigator.pop(context);

//              //reference, not correct
//              onPressed: () {
//                addTaskCallBack(_title);
//              },
              },
            ),
          ],
        ),
      ),
    );
  }
}
