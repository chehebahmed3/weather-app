import 'package:flutter/material.dart';

class CircleColor extends StatelessWidget {
  final Color colorapp;
  final double number1;
  final double number2;
  final double height;
  const CircleColor({
    super.key,
    required this.colorapp,
    required this.number1,
    required this.number2,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(number1, number2),
      child: Container(
        height: height,
        width: 500,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorapp,
        ),
      ),
    );
  }
}
