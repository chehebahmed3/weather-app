import 'package:flutter/material.dart';

class IconWeather extends StatelessWidget {
  final String image;
  final String text1;

  const IconWeather({
    super.key,
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
              'zebi',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
