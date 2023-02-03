import 'package:bee_haak_app/widget/listview/product_listview.dart';
import 'package:flutter/material.dart';

class NaturePage extends StatelessWidget {
  const NaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nature'),
      ),
      body: const Center(
        child: ListViewProduct(cantidad: 10),
      ),
    );
  }
}