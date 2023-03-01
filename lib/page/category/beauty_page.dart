import 'package:bee_haak_app/widget/listview/product_listview.dart';
import 'package:flutter/material.dart';

class PageBeauty extends StatelessWidget {
  const PageBeauty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beauty'),
      ),
      body: const Center(
        child: Expanded(child: ProductListView()),
      ),
    );
  }
}