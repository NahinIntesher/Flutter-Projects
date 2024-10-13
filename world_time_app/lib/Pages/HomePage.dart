import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/ChooseLocation.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;
import 'dart:async';

class HomePage extends StatefulWidget {
  final String location;
  final String time;
  const HomePage({
    super.key,
    required this.location,
    required this.time,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String currentTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    currentTime = widget.time;
    updateTime();
    timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => updateTime());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void updateTime() {
    setState(() {
      currentTime = getCurrentTimeForLocation(widget.location);
    });
  }

  String getCurrentTimeForLocation(String location) {
    final Map<String, String> locationTimeZones = {
      'Bangladesh': 'Asia/Dhaka',
      'India': 'Asia/Kolkata',
      'Pakistan': 'Asia/Karachi',
      'Sri Lanka': 'Asia/Colombo',
      'China': 'Asia/Shanghai',
      'Iran': 'Asia/Tehran',
      'Iraq': 'Asia/Baghdad',
      'Bhutan': 'Asia/Thimphu',
      'Thailand': 'Asia/Bangkok',
      'United States of America': 'America/New_York', // Eastern Time (ET)
      'London': 'Europe/London',
      'Russia': 'Europe/Moscow',
      'Japan': 'Asia/Tokyo',
      'Canada': 'America/Toronto', // Assuming Eastern Time for Canada
      'Italy': 'Europe/Rome',
      'Spain': 'Europe/Madrid',
      'Portugal': 'Europe/Lisbon',
    };

    String timeZone = locationTimeZones[location] ?? 'UTC';
    tz.TZDateTime now = tz.TZDateTime.now(tz.getLocation(timeZone));
    return DateFormat('hh:mm:ss a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.teal[200],
        title: const Text(
          'Time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Headland One",
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Column(
                  children: [
                    Text(
                      'Location: ${widget.location}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fira Code',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Time: $currentTime',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Fira Code',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 300),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[200],
                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChooseLocation()),
                    );
                  },
                  child: const Text(
                    'Change Location',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
