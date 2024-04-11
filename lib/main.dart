import 'package:flutter/material.dart';

import 'my_tasks.dart';
import 'tag.dart';
import 'task.dart';
import 'task_list.dart';

void main() {
  runApp(const TasksApp());
}

// An app that groups tasks in various ways
class TasksApp extends StatelessWidget {
  const TasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Superlist Flutter Assessment',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: MyTasks(
        tasks: tasks,
      ),
    );
  }
}

// Sample Data
//
// Use this fake, mock, or "sample" data throughout the app to complete the
// assessment
const tag1 = Tag(uuid: 'tag-1', title: 'Sample Tag');
const tag2 = Tag(uuid: 'tag-2', title: 'Another Sample Tag');
final yesterday = DateTime.now().subtract(const Duration(hours: 24)).toUtc();
final today = DateTime.now().toUtc();
final tomorrow = DateTime.now().add(const Duration(hours: 24)).toUtc();
final later = DateTime.now().add(const Duration(days: 5)).toUtc();
final tasks = [
  TaskList(
    uuid: 'list-1',
    title: 'Travel Checklist',
    tasks: [
      Task(
        uuid: 'task-1',
        title: 'Suitcase',
        tags: [tag1, tag2],
        complete: false,
        dueDate: today,
      ),
      Task(
        uuid: 'task-2',
        title: 'Shirts',
        tags: [tag2],
        complete: true,
        dueDate: today,
      ),
      Task(
        uuid: 'task-3',
        title: 'Sunglasses',
        tags: [],
        complete: false,
        dueDate: tomorrow,
      ),
    ],
  ),
  TaskList(
    uuid: 'list-2',
    title: 'Shopping List',
    tasks: [
      Task(
        uuid: 'task-4',
        title: 'Carrots',
        tags: [tag2],
        complete: true,
        dueDate: today,
      ),
      Task(
        uuid: 'task-5',
        title: 'Celery',
        tags: [],
        complete: true,
        dueDate: yesterday,
      ),
      const Task(
        uuid: 'task-6',
        title: 'Apple Sauce',
        tags: [tag2],
        complete: false,
      ),
    ],
  ),
  TaskList(
    uuid: 'list-3',
    title: 'Hiking Checklist',
    tasks: [
      Task(
        uuid: 'task-7',
        title: 'Sunscreen',
        tags: [tag2],
        complete: true,
        dueDate: later,
      ),
      Task(
        uuid: 'task-8',
        title: 'Hiking Shoes',
        tags: [tag1],
        complete: true,
        dueDate: later,
      ),
      Task(
        uuid: 'task-9',
        title: 'First Aid Kit',
        tags: [tag1],
        complete: false,
        dueDate: tomorrow,
      ),
    ],
  ),
];
