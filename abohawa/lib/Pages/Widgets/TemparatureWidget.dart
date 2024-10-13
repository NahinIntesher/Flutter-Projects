import 'package:abohawa/Pages/Widgets/BoxDacorationWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TemparatureWidget extends StatefulWidget {
  String temparature;
  TemparatureWidget({super.key, required this.temparature});

  @override
  State<TemparatureWidget> createState() => _TemparatureWidgetState();
}

class _TemparatureWidgetState extends State<TemparatureWidget> {
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
              'Temparature -> ${widget.temparature} °C',
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
