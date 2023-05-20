import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/blocks/weather/weather_event.dart';
import '../../repositories/weather_repository.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

   WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<GetWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        final weather = await weatherRepository.getWeather(event.city);
        emit(WeatherLoaded(weather));
      } catch (e) {
        emit(WeatherError(e.toString()));
      }
    });
  }
}
