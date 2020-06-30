import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'task_list_view.dart';
import 'package:provider/provider.dart';
import 'package:todoprovider/model/task_data.dart';

//class TasksScreen extends StatefulWidget {
//  @override
//  _TasksScreenState createState() => _TasksScreenState();
//}
//
//class _TasksScreenState extends State<TasksScreen> {

//because we use provider, we don not need to pass data, originally we had
// setState callback in fab but we don't need it now, we also removed the
//task list, and we can get list length from listening changes in the
//TaskData class, so we can change this class to StatelessWidget
class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.lightBlueAccent,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                //Builder is a function that is called whenever the ChangeNotifier changes.
                //(In other words, when you call notifyListeners() in your model,
                // all the builder methods of all the corresponding Consumer
                // widgets are called.)

                //The first one is context, which you also get in every build method
                //The second argument of the builder function is the instance
                // of the ChangeNotifier. It’s what we were asking for in the
                // first place. You can use the data in the model to define
                // what the UI should look like at any given point.
                //The third argument is child, which is there for optimization.
                // If you have a large widget subtree under your Consumer that
                // doesn’t change when the model changes, you can construct it
                // once and get it through the builder.
                //this one will rebuild Text widget, which may not necessary
//                Consumer<TaskData>(
//                  builder: (context, taskData, child) => Text(
//                    '${taskData.taskList.length} tasks with Consumer',
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 18,
//                    ),
//                  ),
//                ),

                //same as above but shorter, so what are the difference?
                //see this:
                //https://stackoverflow.com/questions/58774301/when-to-use-provider-ofx-vs-consumerx-in-flutter
                Text(
                  //when set listen is false, we get error when adding new task,
                  //because we indeed need to update UI with new data.
                  '${Provider.of<TaskData>(context).taskList.length} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              //ListView constructor is appropriate for list views with a small
              // number of children because constructing the [List] requires
              // doing work for every child that could possibly be displayed in
              // the list view instead of just those children that are actually visible.
              //It is usually more efficient to create children on demand using [ListView.builder].
              child:
                  TaskListView(), //no need to pass data like previous version
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //previous version:
        //onPressed: () {
        //  showModalBottomSheet(
        //    context: context,
        //      builder: (context) => AddTaskScreen(
        //        addTaskCallBack: (newValue) {
        //           setState(() {
        //              tasks.add(Task(title: newValue));
        //              Navigator.pop(context);
        //                });
        //              },
        //            ),
        //          );
        //        },

        onPressed: () {
          showModalBottomSheet(
            context: context,
            //add this:
            isScrollControlled: true,
            //and we wrap AddTaskScreen() with other widget
            builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    //https://api.flutter.dev/flutter/widgets/MediaQuery-class.html
                    //https://stackoverflow.com/questions/49704497/how-to-make-flutter-app-responsive-according-to-different-screen-size
                    //https://medium.com/tagmalogic/widgets-sizes-relative-to-screen-size-in-flutter-using-mediaquery-3f283afc64d6
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child:
                    AddTaskScreen(), //no need to pass data like previous version
              ),

//            //the following is wrong
//            builder: (context) => Consumer<TaskData>(
//              builder: (context, taskData, child) => AddTaskScreen(
//                addTaskCallBack: (newValue) {
//                  setState(() {
//                    taskData.taskList.add(Task(title: newValue));
//                    Navigator.pop(context);
//                  });
//                },
//              ),
//            ),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
    );
  }
}
