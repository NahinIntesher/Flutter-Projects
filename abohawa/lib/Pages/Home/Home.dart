// ignore: file_names
import 'package:abohawa/Pages/Widgets/DecriptionWeatherWidget.dart';
import 'package:abohawa/Pages/Widgets/HumidityWidget.dart';
import 'package:abohawa/Pages/Widgets/LocationWidget.dart';
import 'package:abohawa/Pages/Widgets/TemparatureWidget.dart';
import 'package:abohawa/Pages/Widgets/WindSpeedWidget.dart';
import 'package:abohawa/Pages/Widgets/bottom_navbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:abohawa/Pages/Widgets/Worker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? location;
  String? temp;
  String? humidity;
  String? windSpeed;
  String? description;
  String? main;
  String? placeHolder;
  final TextEditingController _searchController = TextEditingController();

  void startApp({String city = 'Dhaka'}) async {
    Worker worker = Worker(location: city);
    await worker.getData();
    setState(() {
      location = worker.location;
      temp = worker.temp;
      humidity = worker.humidity;
      windSpeed = worker.windSpeed;
      description = worker.description;
      main = worker.main;
      placeHolder = "Enter city name";
    });
  }

  @override
  void initState() {
    placeHolder = "Enter city name";
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ABOHAWA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'Headland One',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 19, 72),
        centerTitle: true,
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    contentPadding: const EdgeInsets.all(20),
                    hintText: placeHolder,
                    hintStyle: const TextStyle(color: Colors.white),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        startApp(city: _searchController.text);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              location != null
                  ? LocationWidget(location: location!)
                  : const CircularProgressIndicator(),
              const SizedBox(height: 10),
              temp != null
                  ? TemparatureWidget(temparature: temp!)
                  : const CircularProgressIndicator(),
              const SizedBox(height: 10),
              humidity != null
                  ? HumidityWidget(humidity: humidity!)
                  : const CircularProgressIndicator(),
              const SizedBox(height: 10),
              windSpeed != null
                  ? WindSpeedWidget(windspeed: windSpeed!)
                  : const CircularProgressIndicator(),
              const SizedBox(height: 10),
              description != null
                  ? DescriptionWeatherWidget(description: description!)
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {
          setState(() {
            
          });
          startApp();
        },
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
          size: 30,
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
