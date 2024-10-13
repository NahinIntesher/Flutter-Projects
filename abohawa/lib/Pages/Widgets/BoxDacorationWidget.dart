import 'package:flutter/material.dart';

class BoxDecorationWidget {
  static getBoxDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.2, 0.8],
        colors: [
          Color.fromARGB(255, 126, 24, 251),
          Color.fromARGB(255, 162, 97, 253),
        ],
      ),
    );
  }
}
