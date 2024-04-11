import 'package:collection/collection.dart';

import 'tag.dart';

/// A piece of work that should to be completed. Each Task is created within a
/// List of tasks, known as a TaskList.
///
/// Each Task has a title and id. Each task may also have a due date, and may have
/// and can have one or more tags to help identify or group the work in
/// different ways.
class Task {
  final String uuid;
  final String title;
  final List<Tag> tags;
  final DateTime? dueDate;
  final bool complete;

  const Task({
    required this.uuid,
    required this.title,
    required this.tags,
    required this.complete,
    this.dueDate,
  });

  @override
  String toString() {
    return 'Task(uuid: $uuid, title: $title, tags: $tags, dueDate: $dueDate, complete: $complete)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.uuid == uuid &&
        other.title == title &&
        const ListEquality().equals(other.tags, tags) &&
        other.dueDate == dueDate &&
        other.complete == complete;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        title.hashCode ^
        const ListEquality().hash(tags) ^
        dueDate.hashCode ^
        complete.hashCode;
  }
}
