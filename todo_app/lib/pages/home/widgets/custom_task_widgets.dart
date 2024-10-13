import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/pages/home/widgets/add_task_dialog_widgetsEdit.dart';
import 'package:todo_app/pages/home/widgets/home_state.dart';

class CustomTaskWidget extends ConsumerWidget {
  const CustomTaskWidget({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final deviceWidth = MediaQuery.of(context).size.width;

    final task = ref.watch(selectedTaskProvider(id));

    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  ref.read(taskListProvider.notifier).toggleTaskStatus(id);
                },
                icon: Icon(
                  task.status ? Icons.check_box : Icons.circle_outlined,
                  color: task.status ? theme.colorScheme.primary : null,
                ),
              ),
              SizedBox(
                width: deviceWidth * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 15,
                        // color: theme.colorScheme.primary,
                        decoration: task.status
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: task.status ? theme.colorScheme.primary : null,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (task.description != null && task.description != "")
                      Text(
                        task.description ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 12,
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AddTaskDialogEdit(taskId: id),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              ref.read(taskListProvider.notifier).removeTask(id);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
