import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetWeather extends WeatherEvent {
  final String city;

  GetWeather(this.city);

  @override
  List<Object?> get props => [city];
}
