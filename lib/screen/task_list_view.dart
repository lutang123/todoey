//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:todoprovider/model/task_data.dart';
import 'package:provider/provider.dart';

//class TaskListView extends StatefulWidget {

//  //we no longer need to pass task list data from task_screen
////  TaskListView({this.tasks});
////  final List<Task> tasks;
//
//  @override
//  _TaskListViewState createState() => _TaskListViewState();
//}
//
//class _TaskListViewState extends State<TaskListView> {

class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //this one we use Consumer to be more efficient because we have multi place
    // we need to access taskData
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(
        itemCount: taskData.taskList.length,
        itemBuilder: (context, index) {
          final task = taskData.taskList[index];
          //in final version, we extract ListTile as a separate widget and pass
          //callback, might be more efficient that way
          return ListTile(
            onLongPress: () {
              taskData.deleteTask(task);
            },
            //reference from callback version
//            onLongPress: () {
//              setState(() {
//                widget.tasks.remove(widget.tasks[index]);
            // or with a function we defined:
////              deleteTask(widget.tasks[index]);
//              });
//            },

//            void deleteTask(Task task) {
//              widget.tasks.remove(task);
//            }

            title: Text(
              task.title,
              style: TextStyle(
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),

            //orinial version has an update function from TaskData
            trailing: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: task.isDone,
                onChanged: (newValue) {
                  taskData.updateTask(task);
                }

//              //previous code, we no longer need to setState
//              onChanged: (newValue) {
//                setState(
//                  () {
//                    task.toggleDone();
//                  },
//                );
//              },

                ),
          );

//          //Type: void Function(bool)
//          onChanged: checkboxCallback,
//          ),
//          //Type: void Function()
//          onLongPress: longPressCallback,
        },
      ),
    );
  }
}

////reference from original:
//class TasksList extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Consumer<TaskListNotifier>(
//      builder: (context, taskListNotifier, child) {
//        return ListView.builder(
//          itemBuilder: (context, index) {
//            final task = taskListNotifier.tasks[index];
//            return TaskTile(
//              taskTitle: task.name,
//              isChecked: task.isDone,
//              checkboxCallback: (checkboxState) {
//                taskListNotifier.updateTask(task);
//              },
//              //  //reference from task_data:
//              //  void updateTask(Task task) {
//              //    task.toggleDone(); //make it not done
//              //    notifyListeners();
//              //  }
//              //  //reference from task:
//              //  void toggleDone() {
//              //    isDone = !isDone;
//              //  }
//              //
//              longPressCallback: () {
//                taskListNotifier.deleteTask(task);
//              },
//              //  //reference from task_data:
//              //  void deleteTask(Task task) {
//              //    _tasks.remove(task);
//              //    notifyListeners();
//              //  }
//            );
//          },
//          itemCount: taskListNotifier.taskCount,
//        );
//      },
//    );
//  }
//}
