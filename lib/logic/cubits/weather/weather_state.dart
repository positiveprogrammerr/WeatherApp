// ignore_for_file: depend_on_referenced_packages

import 'package:meta/meta.dart';

import '../../../data/models/weather.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather);
}

class WeatherLoading extends WeatherState {}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}

class WeatherCityNotFound extends WeatherError {
  WeatherCityNotFound() : super('City not found');
}
