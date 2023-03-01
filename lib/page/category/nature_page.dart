import 'package:bee_haak_app/widget/listview/product_liesview_category.dart';
import 'package:flutter/material.dart';

class PageNature extends StatelessWidget {

  const PageNature({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nature'),
      ),
      body:  const ProductListViewCategory()
    );
  }
}