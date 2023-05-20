import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../data/constants/constants.dart';
import '../../../data/models/weather.dart';
import '../exeptions/weather_exeptions.dart';


class WeatherApiServices {
  final http.Client client;

  WeatherApiServices({
    required this.client,
  });

  Future<Weather> getWeather(String city) async {
    final url = Uri.parse('$base_url?q=${city.toLowerCase()}&units=metric&appid=$api_key');

    try {
      final response = await client.get(url);

      if (response.statusCode >= 400) {
        throw Exception(response.reasonPhrase);
      }

      final responseBody = jsonDecode(response.body);
      if (responseBody == null) {
        throw WeatherExeptions('Cannot get weather for $city');
      }
      final data = responseBody as Map<String, dynamic>;
      final weatherData = data['weather'][0];
      final mainData = data['main'];

      final Weather weather = Weather(
        id: weatherData['id'].toString(),
        main: weatherData['main'],
        desc: weatherData['description'],
        icon: weatherData['icon'],
        temperature: double.parse(mainData['temp'].toString()),
        city: city,
      );
      return weather;
    } catch (e) {
      throw WeatherExeptions(e.toString());
    }
  }
}