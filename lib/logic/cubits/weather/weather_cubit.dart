// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../../repositories/weather_repository.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherCubit({required this.weatherRepository}) : super(WeatherInitial());

  Future<void> getWeather(String city) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getWeather(city);
      // ignore: unnecessary_null_comparison
    
        emit(WeatherLoaded(weather));
      
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
