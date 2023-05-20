import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:weather_app/presentation/screens/search_screen.dart';
import 'package:weather_app/presentation/screens/settings_screen.dart';
import 'logic/blocks/bloc/settings_bloc.dart';
import 'logic/blocks/weather/weather_bloc.dart';
import 'logic/repositories/weather_repository.dart';
import 'logic/services/https/weather_api_services.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        weatherApiServices: WeatherApiServices(client: Client()),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          BlocProvider(create: (context) => SettingsBloc(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather App',
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            SettingsScreen.routeName: (context) => const SettingsScreen(),
            SearchPage.routeName: (context) => const SearchPage(),
          },
           theme: ThemeData(
            primaryColor: Colors.grey,
            textTheme: const TextTheme(
              bodyMedium: TextStyle(
                fontFamily: 'Wix',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
