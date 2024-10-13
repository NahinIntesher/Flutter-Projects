import 'package:flutter/material.dart';

import 'package:simple_id_card/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Id Card',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.purpleAccent.shade700),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
