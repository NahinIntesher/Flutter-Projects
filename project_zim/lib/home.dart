import 'package:flutter/material.dart';
import 'package:project_zim/input_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text(
          'Session 5: Counter App',
          style: TextStyle(
            fontFamily: 'Fira Code',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lime,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.orange,
                height: counter,
                width: 100,
              ),
              Text("Counter: $counter"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter += 10;
                    });
                  },
                  child: const Text('Increment')),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter = 0;
                    });
                  },
                  child: const Text('Reset')),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InputPage()),
                  );
                },
                child: const Text('Go to Input Page'),
              ),
            ]),
      ),
    );
  }
}
