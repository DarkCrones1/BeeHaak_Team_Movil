
import 'package:bee_haak_app/widget/listview/product_lisview_candy.dart';
import 'package:flutter/material.dart';

class PageCandy extends StatelessWidget {
  const PageCandy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candy'),
      ),
      body:  const ProductListViewCandy(),
    );
  }
}