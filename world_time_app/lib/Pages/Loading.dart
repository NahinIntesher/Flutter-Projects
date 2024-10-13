import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:world_time_app/Pages/ChooseLocation.dart';

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
        toolbarHeight: 100,
        backgroundColor: Colors.teal[200],
        title: const Text(
          'World Time App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Headland One",
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Loading...',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Lottie.network(
                "https://lottie.host/dc0f3596-2143-434e-b2e8-0e4ba4fcb3ae/lE5pSKfT9t.json"),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                minimumSize: const Size(100, 60),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChooseLocation(),
                  ),
                );
              },
              label: const Text('Edit Location',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
              icon: const Icon(Icons.edit_location,
                  color: Colors.black, size: 35),
            ),
          ],
        ),
      ),
    );
  }
}
