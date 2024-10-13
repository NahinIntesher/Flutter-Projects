import 'package:abohawa/Pages/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 9, 19, 72),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.8, 0.99],
            colors: [
              Color.fromARGB(255, 9, 19, 72),
              Color.fromARGB(255, 47, 20, 94),
              Color.fromARGB(255, 92, 46, 172),
              Color.fromARGB(255, 172, 129, 248),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Lottie.network(
                  'https://lottie.host/2a49864e-0b16-434e-bc42-4141a1e2a4fd/3qg71Id1SL.json',
                  fit: BoxFit.contain, // Path to your Lottie animation file
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'ABOHAWA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Headland One',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shadowColor: Colors.green,
                  minimumSize: const Size(50, 50), // Background color
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Color.fromARGB(255, 47, 20, 94),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
