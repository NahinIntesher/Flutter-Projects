import 'package:abohawa/Pages/Home/Loading.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Abohawa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 9, 19, 72)),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white, // Global color for all AppBars
          ),
        ),
      ),
      home: const Loading(),
    );
  }
}

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: screenWidth < 600 ? 20 : 30,
      fontFamily: 'Headland One',
      fontWeight: FontWeight.bold,
    );

    return Container(
      color: Colors.black, // Added for better visibility of white text
      child: Text(
        'ABOHAWA',
        style: textStyle,
      ),
    );
  }
}
