import 'package:abohawa/Pages/Widgets/BoxDacorationWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DescriptionWeatherWidget extends StatefulWidget {
  String description;
  DescriptionWeatherWidget({super.key, required this.description});

  @override
  State<DescriptionWeatherWidget> createState() =>
      DescriptionWeatherWidgetState();
}

class DescriptionWeatherWidgetState extends State<DescriptionWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecorationWidget.getBoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              'Weather -> ${widget.description.toUpperCase()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Fira Code',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
