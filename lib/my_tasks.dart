import 'package:flutter/material.dart';

import 'task_list.dart';

// TODO: Create a Widget that displays a list of tasks in different ways.
class MyTasks extends StatelessWidget {
  const MyTasks({super.key, required this.tasks});

  final List<TaskList> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.filter_list),
      ),
    );
  }
}
