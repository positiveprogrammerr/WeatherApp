import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocks/bloc/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return ListTile(
            title: const Text('Temperature Unit'),
            subtitle: Text(
              state.tempUnits == TempUnits.celsius
                  ? 'Celsius °C'
                  : 'Fahrenheit °F',
            ),
            trailing: Switch.adaptive(
              activeColor: Colors.grey,
              value: state.tempUnits == TempUnits.celsius,
              onChanged: (_) {
                context.read<SettingsBloc>().add(ToggleTemperature());
              },
            ),
          );
        },
      ),
    );
  }
}
