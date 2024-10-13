import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/home/widgets/home_state.dart';
import 'package:uuid/uuid.dart';

class AddTaskDialog extends ConsumerStatefulWidget {
  const AddTaskDialog({super.key});

  @override
  ConsumerState<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends ConsumerState<AddTaskDialog> {
  late TextEditingController titleController, decroptionController;
  late GlobalKey<FormState> formkey;

  // For controlling Text tile & Text Description
  @override
  void initState() {
    titleController = TextEditingController();
    decroptionController = TextEditingController();
    formkey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    decroptionController.dispose();
    // formkey.dispose();
    super.dispose();
  }

  void addNewTask({
    required String title,
    String? description,
  }) {
    final newTask = Task(
      id: const Uuid().v4(),
      title: title,
      description: description,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Add new task to the list
    ref.read(taskListProvider.notifier).addTask(newTask);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Task"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton.icon(
          onPressed: () {
            final title = titleController.text;
            final description = decroptionController.text;
            final valid = formkey.currentState?.validate() ?? false;
            if (!valid) {
              return;
            }
            if (title.isEmpty) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Title is required")),
              );
              return;
            }
            addNewTask(
              title: title,
              description: description,
            );
            Navigator.of(context).pop();
          },
          label: const Text("Add"),
          icon: const Icon(Icons.add),
        )
      ],
      content: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: titleController,
              maxLength: 100,
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Task Title",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Title is required";
                }
                if (value.length < 3) {
                  return "At least 3 charecters";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: decroptionController,
              minLines: 1,
              maxLines: 5,
              maxLength: 5000,
              decoration: const InputDecoration(
                labelText: "Task Description",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                // It can be null but if not null then min 5 char
                if (value != null && value != "" && value.length < 5) {
                  return "At least 5 charecters";
                }
                return null;
              },
            )
          ],
        ),
      ),
    );
  }
}
