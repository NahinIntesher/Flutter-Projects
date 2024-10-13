import 'package:flutter/material.dart';
import 'package:project_zim/home.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? user;
  late TextEditingController controller;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose(); // For disposing a controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Session 6: Input Example",
          style: TextStyle(
            fontFamily: 'Fira Code',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.greenAccent,
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                user ?? 'No user',
                style: const TextStyle(
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  if (value == null) {
                    return 'Please enter your name';
                  }
                  if (value.length < 3) {
                    return 'Please enter more than 2 charecter';
                  }
                  if (value.length > 10) {
                    return 'Please enter less than 10 charecter';
                  } else {
                    setState(() {
                      user = value;
                    });
                  }
                  return null;
                },
                controller: controller,
                decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // -> formKey.currentState?.validate(); // goto line no 59 to validate form state
                  final isValid = formKey.currentState?.validate() ?? false;
                  if (isValid) {
                    final output = controller.text;
                    setState(() {
                      user = output;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter at least 3 characters')));
                  }
                },
                child: const Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
