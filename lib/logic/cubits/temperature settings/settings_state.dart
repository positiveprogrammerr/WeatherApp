part of 'settings_cubit.dart';

enum TempUnits{
  celcius,fahrenheiit,
}

@immutable
 class SettingsState {
  final TempUnits? tempUnits;
  const SettingsState({
     this.tempUnits,
  });
}


