import 'package:abohawa/Pages/Widgets/BoxDacorationWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LocationWidget extends StatefulWidget {
  String location;
  LocationWidget({super.key, required this.location});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
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
              '${widget.location} City',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
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
