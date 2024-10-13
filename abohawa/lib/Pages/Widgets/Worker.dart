import 'dart:convert';
import 'package:http/http.dart' as http;

class Worker {
  String? location;
  String? temp;
  String? humidity;
  String? windSpeed;
  String? description;
  String? main;

  Worker({this.location});

  Future<void> getData() async {
    try {
      // Making the HTTP GET request to the OpenWeatherMap API
      http.Response response = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=56c36e50f6b699df1bcb304889c87140',
        ),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Decoding the JSON response into a Map
        Map<String, dynamic> data = jsonDecode(response.body);

        // Main Data
        Map<String, dynamic> mainData = data['main'];

        // Weather Data
        List<dynamic> weatherData = data['weather'];
        Map<String, dynamic> weatherMainData = weatherData[0];

        // Wind Data
        Map<String, dynamic> windData = data['wind'];

        // Assigning fetched data to instance variables
        location = data['name'];
        temp = (mainData['temp'] - 273.15).toStringAsFixed(1);
        humidity = mainData['humidity'].toString();
        windSpeed = windData['speed'].toString();
        description = weatherMainData['description'];
        main = weatherMainData['main'];
      } else {
        // Handle unsuccessful API request
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      // Handle any errors that occurred during the API call
      location = "NA";
      temp = "NA";
      humidity = "NA";
      windSpeed = "NA";
      description = "Can't Find Data";
      main = "NA";
      print('Error: $e');
      throw Exception('Failed to load weather data');
    }
  }
}
