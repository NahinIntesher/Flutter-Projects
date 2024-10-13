import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:world_time_app/Pages/Loading.dart';

void main() {
  tz.initializeTimeZones(); // Initialize time zones
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lime),
        useMaterial3: true,
      ),
      home: const Loading(),
    );
  }
}
