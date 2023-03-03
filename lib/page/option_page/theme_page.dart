import 'package:bee_haak_app/statemanager/theme/theme_mode.dart';
import 'package:flutter/material.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select your Theme'),
      ),
      body: const SelectTheme(),
    );
  }
}