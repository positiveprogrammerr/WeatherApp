import 'package:flutter/material.dart';

import '../../data/models/weather.dart';

class CityPart extends StatelessWidget {
  const CityPart({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          weather.city.substring(0, 1).toUpperCase() +
              weather.city.substring(1),
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 34),
        ),
        Text(
          weather.desc,
          style: const TextStyle(
              color: Colors.white, fontSize: 18),
        ),
      ],
    );
  }
}
