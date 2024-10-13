import 'package:abohawa/Pages/Widgets/BoxDacorationWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HumidityWidget extends StatefulWidget {
  String humidity;
  HumidityWidget({super.key, required this.humidity});

  @override
  State<HumidityWidget> createState() => _HumidityWidgetState();
}

class _HumidityWidgetState extends State<HumidityWidget> {
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
              'Humidity -> ${widget.humidity} %',
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
