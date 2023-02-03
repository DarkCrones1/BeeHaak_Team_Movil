
import 'package:bee_haak_app/widget/listview/product_listview.dart';
import 'package:flutter/material.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: const [
          Card()
        ],
      ),
    );
  }
}