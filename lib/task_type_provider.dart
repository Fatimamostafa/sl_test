import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superlist/main.dart';
import 'package:superlist/task_list.dart';

final taskListsProvider = Provider<List<TaskList>>((ref) => tasks);

enum GroupType { none, byDueDate, byTag, byTaskList }

class GroupTypeController extends StateNotifier<GroupType> {
  GroupTypeController(super.initialGroupType);

  void setGroupType(GroupType type) {
    state = type;
  }
}

final groupingProvider =
    StateNotifierProvider<GroupTypeController, GroupType>((ref) {
  return GroupTypeController(GroupType.none);
});
