import 'package:bee_haak_app/widget/listview/product_listview.dart';
import 'package:flutter/material.dart';

class CandyPage extends StatelessWidget {
  const CandyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candy'),
      ),
      body: const Center(
        child: ListViewProduct(cantidad: 10),
      ),
    );
  }
}