import 'package:bee_haak_app/statemanager/theme/theme_mode.dart';
import 'package:bee_haak_app/widget/buttons/button_navegation.dart';
import 'package:flutter/material.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Options'),
        actions: const [
          ButtonPage(icon: Icons.account_circle_outlined, ruta: '/login_page', ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
              ],
            ),
          ],
        ),
      ),
    );
  }
}