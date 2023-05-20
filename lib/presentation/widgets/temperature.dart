import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/weather.dart';
import '../../logic/blocks/bloc/settings_bloc.dart';

class Temperature extends StatefulWidget {
  const Temperature({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  String _showTemperature(double temp){
    final tempUnit = context.watch<SettingsBloc>().state.tempUnits;
    if(tempUnit == TempUnits.fahrenheit){
      return '${((temp*9/5)+32).toStringAsFixed(0)}°F';
    }
    return '${temp.toStringAsFixed(0)}°C';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _showTemperature(widget.weather.temperature),
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 0.1,
              fontSize: 51),
        ),
        Container(
          margin: const EdgeInsets.only(right:30.0),
          child: Row(
            children: [
              Image.network('https://openweathermap.org/img/wn/${widget.weather.icon}.png', height: 65,width: 65,),
              Text(
                widget.weather.main,
                style: const TextStyle(
                    color: Colors.white, fontSize: 26),
              ),
            ],
          ),
        ),
      ],
    );
  }
}