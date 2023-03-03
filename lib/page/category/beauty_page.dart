
import 'package:bee_haak_app/widget/listview/product_lisview_beauty.dart';
import 'package:flutter/material.dart';

class PageBeauty extends StatelessWidget {
  const PageBeauty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beauty'),
      ),
      body:  const ProductListViewBeauty()
    );
  }
}