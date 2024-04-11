import 'package:flutter/material.dart';
import 'package:superlist/tasks_list_screen.dart';
import 'package:superlist/widgets/bottom_sheet.dart';

import 'task_list.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({super.key, required this.tasks});

  final List<TaskList> tasks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
      ),
      body: const TasksListScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(

            context: context,
            builder: (BuildContext context) {
              return const TaskTypesBottomSheet();
            },
          );
        },
        tooltip: 'Choose Task Type',
        child: const Icon(Icons.filter_list),
      ),
    );
  }
}
