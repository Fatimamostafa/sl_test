import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:superlist/task_type_provider.dart';

class TaskTypesBottomSheet extends ConsumerWidget {
  const TaskTypesBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(groupingProvider.notifier);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildListTile(context, 'None', provider, GroupType.none),
        _buildListTile(context, 'Due Date', provider, GroupType.byDueDate),
        _buildListTile(context, 'Task List', provider, GroupType.byTaskList),
        _buildListTile(context, 'Tag', provider, GroupType.byTag),
      ],
    );
  }

  Widget _buildListTile(BuildContext context, String option,
      GroupTypeController provider, GroupType groupType) {
    return ListTile(
      title: Text(option),
      onTap: () {
        provider.setGroupType(groupType);
        Navigator.pop(context);
      },
    );
  }
}
