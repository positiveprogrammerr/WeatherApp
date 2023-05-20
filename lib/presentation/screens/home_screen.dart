import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/blocks/weather/weather_bloc.dart';
import '../../logic/blocks/weather/weather_event.dart';
import '../../logic/blocks/weather/weather_state.dart';
import '../widgets/city_part.dart';
import '../widgets/temperature.dart';
import '../widgets/weather_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<WeatherBloc>().add(GetWeather('uzbekistan'));
    super.initState();
  }

  void _getWeather(String city) {
    context.read<WeatherBloc>().add(GetWeather(city));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (ctx, state) async {
          if (state is WeatherError) {
            await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Error',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: Text(
                    state.message.contains('Bad Request')
                        ? 'City Not Found'
                        : state.message,
                    style: const TextStyle(fontSize: 16),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          
              _getWeather('uzbekistan');
            
          }
        },
        builder: (ctx, state) {
          if (state is WeatherInitial) {
            return const Center(
              child: Text('Select City'),
            );
          }
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          }
          if (state is WeatherLoaded) {
            final weather = state.weather;
            String imagePath;
            if (weather.main.contains('Rain')) {
              imagePath = 'rainy';
            } else if (weather.main.contains('Sun')) {
              imagePath = 'sunny';
            } else if (weather.main.contains('Cloud')) {
              imagePath = 'cloudy';
            } else {
              imagePath = 'night';
            }
            return Stack(
              children: [
                Image.asset(
                  'assets/images/$imagePath.jpg',
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
                Container(
                  color: Colors.black.withOpacity(0.6),
                ),
                Positioned(
                  right: 0,
                  top: 40,
                  child: WeatherMenu(getWeather: _getWeather),
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 25, bottom: 20, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CityPart(weather: weather),
                        Temperature(weather: weather),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
