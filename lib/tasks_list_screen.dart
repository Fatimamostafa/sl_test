import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superlist/task.dart';
import 'package:superlist/task_list.dart';
import 'package:superlist/task_type_provider.dart';
import 'package:superlist/widgets/task_tile.dart';

class TasksListScreen extends ConsumerWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskLists = ref.watch(taskListsProvider);
    final grouping = ref.watch(groupingProvider);

    Map<String, List<Task>> groupedTasks;

    switch (grouping) {
      case GroupType.none:
        groupedTasks = {
          'All Tasks': taskLists.expand((taskList) => taskList.tasks).toList()
        };
        break;
      case GroupType.byTaskList:
        groupedTasks = {
          for (var taskList in taskLists) taskList.title: taskList.tasks
        };
        break;
      case GroupType.byDueDate:
        groupedTasks = groupTasksByDueDate(taskLists);
        break;
      case GroupType.byTag:
        groupedTasks = groupTasksByTag(taskLists);
        break;
    }

    return ListView(
      children: groupedTasks.entries.map((entry) {
        return entry.value.isNotEmpty
            ? ExpansionTile(
          title: Text(entry.key),
          children:
          entry.value.map((task) => TaskTile(task: task)).toList(),
        )
            : const SizedBox.shrink();
      }).toList(),
    );
  }

  ///For improvement we can create another controller to fetch the formatted
  ///instead of directly using the function from the screen
  Map<String, List<Task>> groupTasksByTag(List<TaskList> taskLists) {
    return taskLists.expand((taskList) => taskList.tasks).fold({},
        (Map<String, List<Task>> groupedByTag, task) {
      for (var tag in task.tags) {
        groupedByTag.putIfAbsent(tag.title, () => []).add(task);
      }
      return groupedByTag;
    });
  }

  Map<String, List<Task>> groupTasksByDueDate(List<TaskList> taskLists) {
    final today = DateTime.now();
    return taskLists.expand((taskList) => taskList.tasks).fold({
      'Overdue': [],
      'Today': [],
      'Tomorrow': [],
      'Later': [],
      'No Due Date': [],
    }, (Map<String, List<Task>> groupedByDueDate, task) {
      final dueDate = task.dueDate;
      if (dueDate == null) {
        groupedByDueDate['No Due Date']!.add(task);
      } else if (dueDate.isBefore(today)) {
        groupedByDueDate['Overdue']!.add(task);
      } else if (dueDate.year == today.year &&
          dueDate.month == today.month &&
          dueDate.day == today.day) {
        groupedByDueDate['Today']!.add(task);
      } else if (dueDate.year == today.year &&
          dueDate.month == today.month &&
          dueDate.day == today.day + 1) {
        groupedByDueDate['Tomorrow']!.add(task);
      } else {
        groupedByDueDate['Later']!.add(task);
      }
      return groupedByDueDate;
    });
  }
}
