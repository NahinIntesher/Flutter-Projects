import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/home/Loading.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/models/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasksBox');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Start To Do',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.limeAccent,
          primary: const Color.fromARGB(255, 115, 150, 69),
          secondary: const Color.fromRGBO(163, 186, 95, 1),
        ),
        useMaterial3: true,
        fontFamily: 'Headland One',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Loading(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
