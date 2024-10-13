import 'package:abohawa/Pages/Widgets/BoxDacorationWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WindSpeedWidget extends StatefulWidget {
  String windspeed;
  WindSpeedWidget({super.key, required this.windspeed});

  @override
  State<WindSpeedWidget> createState() => WindSpeedWidgetState();
}

class WindSpeedWidgetState extends State<WindSpeedWidget> {
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
              'Wind Speed -> ${widget.windspeed}  m/s',
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
