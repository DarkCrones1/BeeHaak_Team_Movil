import 'package:bee_haak_app/widget/listview/product_listview.dart';
import 'package:flutter/material.dart';

class BeautyPage extends StatelessWidget {
  const BeautyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beauty'),
      ),
      body: const Center(
        child: ListViewProduct(cantidad: 10),
      ),
    );
  }
}