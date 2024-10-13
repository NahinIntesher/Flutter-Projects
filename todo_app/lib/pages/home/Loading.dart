import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with WidgetsBindingObserver {
  bool _alreadyNavigated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _navigateToHome();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!_alreadyNavigated) {
      _alreadyNavigated = true;
      // Navigate to home only if not already navigated
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed && !_alreadyNavigated) {
      _navigateToHome();
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Prevent going back to the Loading screen
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.3, 0.7, 0.9],
              colors: [
                Color.fromARGB(255, 156, 188, 69),
                Color.fromARGB(255, 168, 199, 45),
                Color.fromARGB(255, 170, 210, 92),
                Color.fromRGBO(163, 186, 95, 1),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Lottie.asset(
                    'assets/Animation1719455588029.json',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Start To Do',
                  style: TextStyle(
                    color: Colors.pink,
                    fontSize: 35,
                    fontFamily: 'Headland One',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Track your tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
