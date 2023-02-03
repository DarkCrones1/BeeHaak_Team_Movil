import 'package:flutter/material.dart';

class RecoverPassPage extends StatelessWidget {
  const RecoverPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forgot Password?',
        ),
      ),
      body: const Center(
        child: Text('RecoverPAss'),
      ),
    );
  }
}