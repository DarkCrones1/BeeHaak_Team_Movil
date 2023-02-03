
import 'package:bee_haak_app/widget/category/category_section.dart';
import 'package:flutter/material.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store'),
      ),
      // backgroundColor: Colors.yellow[800],
      body: const Center(
        child: CategorySection(cantidad: 3),
      ),
    );
  }
}