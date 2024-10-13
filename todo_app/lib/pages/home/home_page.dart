import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/pages/home/widgets/add_task_dialog_widgets.dart';
import 'package:todo_app/pages/home/widgets/bottom_navbar_widgets.dart';
import 'package:todo_app/pages/home/widgets/custom_task_widgets.dart';
import 'package:todo_app/pages/home/widgets/home_state.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    final incompleteTasks = ref.watch(incompletedTaskProvider);
    final completeTasks = ref.watch(completedTaskProvider);

    final taskListWidget = incompleteTasks.map((singleTask) {
      return CustomTaskWidget(id: singleTask.id);
    }).toList();

    final completedTaskWidget = completeTasks.map((singleTask) {
      return CustomTaskWidget(id: singleTask.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AboutDialog(
                  applicationName: 'Start To Do',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(Icons.check),
                  children: [
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Headland One',
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Developed by ',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          TextSpan(
                            text: 'Nahin Intesher',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                '\n\nThis is a simple To Do app that helps you keep track of your tasks.',
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
        toolbarHeight: deviceHeight * 0.09,
        centerTitle: true,
        title: const Text(
          "Start To Do",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            fontFamily: 'Headland One',
            color: Colors.white,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/task1.jpg'),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddTaskDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
      body: incompleteTasks.isEmpty && completeTasks.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: deviceWidth * 0.5,
                  height: deviceWidth * 0.5,
                  child: Lottie.asset(
                    'assets/Animation1714526349313.json',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'No Tasks Yet',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Headland One",
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Click on the + button to add a new task',
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: "Headland One",
                    fontSize: 12,
                  ),
                ),
              ],
            ))
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(deviceWidth * 0.02),
                child: Column(
                  children: [
                    ...taskListWidget,
                    const SizedBox(height: 10),
                    ExpansionTile(
                      initiallyExpanded: true,
                      title: Text(
                        'Completed Tasks (${completedTaskWidget.length})',
                        style: TextStyle(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      children: completedTaskWidget,
                    ),
                  ],
                ),
              ),
            ),
      backgroundColor: const Color.fromARGB(255, 242, 251, 216),
    );
  }
}
