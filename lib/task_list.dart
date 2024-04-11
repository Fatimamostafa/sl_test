import 'package:collection/collection.dart';

import 'task.dart';

/// A class with a title that holds many Tasks.
class TaskList {
  final String uuid;
  final String title;
  final List<Task> tasks;

  const TaskList({
    required this.uuid,
    required this.title,
    required this.tasks,
  });

  @override
  String toString() => 'TaskList(uuid: $uuid, title: $title, tasks: $tasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskList &&
        other.uuid == uuid &&
        other.title == title &&
        const ListEquality().equals(other.tasks, tasks);
  }

  @override
  int get hashCode =>
      uuid.hashCode ^ title.hashCode ^ const ListEquality().hash(tasks);
}
