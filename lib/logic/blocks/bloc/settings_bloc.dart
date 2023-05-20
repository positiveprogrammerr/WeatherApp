// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';
part 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState(tempUnits: TempUnits.celsius)) {
    on<ToggleTemperature>((event, emit) {
      if (state.tempUnits == TempUnits.celsius) {
        emit(const SettingsState(tempUnits: TempUnits.fahrenheit));
      } else {
        emit(const SettingsState(tempUnits: TempUnits.celsius));
      }
    });
  }
}
