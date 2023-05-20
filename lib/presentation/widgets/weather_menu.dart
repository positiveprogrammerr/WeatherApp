import 'package:flutter/material.dart';

import '../screens/search_screen.dart';
import '../screens/settings_screen.dart';

class WeatherMenu extends StatelessWidget {
  final Function getWeather;
  const WeatherMenu({
    super.key,
    required this.getWeather,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () async {
            final selectedCity = await Navigator.of(context).pushNamed(SearchPage.routeName);
            if (selectedCity != null) {
              getWeather(selectedCity);
            }
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 32,
          ),
        ),
        IconButton(onPressed: (){
          Navigator.of(context).pushNamed(SettingsScreen.routeName);
        }, icon: const Icon(Icons.settings,color: Colors.white,size: 29.2,))
      ],
    );
  }
}
