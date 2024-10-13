import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/pages/home/widgets/home_state.dart';
import 'package:uuid/uuid.dart';

class AddTaskDialogEdit extends ConsumerStatefulWidget {
  const AddTaskDialogEdit({Key? key, this.taskId}) : super(key: key);

  final String? taskId;

  @override
  ConsumerState<AddTaskDialogEdit> createState() => _AddTaskDialogEditState();
}

class _AddTaskDialogEditState extends ConsumerState<AddTaskDialogEdit> {
  late TextEditingController titleController, descriptionController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    formKey = GlobalKey<FormState>();

    if (widget.taskId != null) {
      // Fetch existing task details and populate the fields
      final task = ref.read(selectedTaskProvider(widget.taskId!));
      titleController.text = task.title;
      descriptionController.text = task.description ?? '';
    }

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void addOrUpdateTask() {
    final title = titleController.text;
    final description = descriptionController.text;
    final valid = formKey.currentState?.validate() ?? false;
    
    if (!valid) {
      return;
    }
    
    if (widget.taskId != null) {
      // Update existing task
      ref.read(taskListProvider.notifier).editTask(
        title: title,
        description: description,
        taskId: widget.taskId!,
      );
    } else {
      // Add new task
      ref.read(taskListProvider.notifier).addTask(
        Task(
          id: const Uuid().v4(),
          title: title,
          description: description,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add/Edit Task"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton.icon(
          onPressed: addOrUpdateTask,
          label: const Text("Save"),
          icon: const Icon(Icons.done_rounded),
        )
      ],
      content: Form(
        key: formKey,
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
                  return "At least 3 characters";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: descriptionController,
              minLines: 1,
              maxLines: 5,
              maxLength: 5000,
              decoration: const InputDecoration(
                labelText: "Task Description",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value != null && value.isNotEmpty && value.length < 5) {
                  return "At least 5 characters";
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
