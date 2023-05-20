// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(const SettingsState(tempUnits: TempUnits.celcius));

void toggleTemperature(){
    if(state.tempUnits == TempUnits.celcius){
      emit(const SettingsState(tempUnits: TempUnits.fahrenheiit));
    }else{
      emit(const  SettingsState(tempUnits: TempUnits.celcius));
    }
}

}