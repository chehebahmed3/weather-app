import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class IconTemperature extends StatelessWidget {
  final String image;
  final String text1;
  final String temperature;
  const IconTemperature({
    super.key,
    required this.temperature,
    required this.image,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 100,
          height: 100,
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text1,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Text(
              temperature,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
