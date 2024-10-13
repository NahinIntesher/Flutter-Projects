import 'package:flutter/material.dart';
import 'package:world_time_app/Pages/HomePage.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  final List<String> _locations = [
    'Bangladesh',
    'India',
    'Pakistan',
    'Sri Lanka',
    'China',
    'Iran',
    'Iraq',
    'Bhutan',
    'Thailand',
    'United States of America',
    'London',
    'Russia',
    'Japan',
    'Canada',
    'Italy',
    'Spain',
    'Portugal',
  ];
  String _dropDownValue = 'Bangladesh'; // Default value

  // Function to get the current time based on the location
  String getTimeForLocation(String location) {
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
    return DateFormat('hh:mm a').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.teal[200],
        title: const Text(
          'Choose a Location',
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
            const Text('Choose a Location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurpleAccent, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButton<String>(
                value: _dropDownValue,
                icon: const Icon(Icons.arrow_drop_up_sharp),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropDownValue = newValue!;
                  });
                },
                items: _locations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[200],
                minimumSize: const Size(100, 40),
              ),
              onPressed: () {
                String selectedTime = getTimeForLocation(_dropDownValue);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      location: _dropDownValue,
                      time: selectedTime,
                    ),
                  ),
                );
              },
              child: const Text('Let\'s Go!',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
