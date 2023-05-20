part of 'settings_bloc.dart';

enum TempUnits {
  celsius,
  fahrenheit,
}

@immutable
class SettingsState {
  final TempUnits tempUnits;

  const SettingsState({
    required this.tempUnits,
  });
}
