import 'package:flutter/material.dart';
import 'screen/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoprovider/model/task_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //from provider, this is to combine with ChangeNotifier
    //Unlike the basic Provider widget, ChangeNotifierProvider listens for
    // changes in the model object. When there are changes, it will rebuild
    // any widgets under the Consumer.
    //The Consumer widget rebuilds any widgets below it whenever
    // notifyListeners() gets called. The button doesn’t need to get updated,
    // though, so rather than using a Consumer, you can use Provider.of and
    // set the listener to false. That way the button won’t be rebuilt when
    // there are changes. Here is the button extracted into its own widget:
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}

//One more thing. You may have noticed in the OtherWidget button handler that
// we used the following syntax:

//final model = Provider.of<MyModel>(context);

//By default, this syntax will automatically cause our OtherWidget instance to
// rebuild whenever MyModel changes. That might not be what we want. After all,
// OtherWidget just contains a button that doesn’t change based on the value of
// MyModel at all. To avoid this, we can use the following syntax to access our
// model without registering for a rebuild:

//final model = Provider.of<MyModel>(context, listen: false);
