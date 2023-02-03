import 'package:bee_haak_app/core/entities/category.dart';
import 'package:bee_haak_app/data/category_repository.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final int cantidad;

  const CategorySection
  ({
    super.key,
    required this.cantidad,
  });

  @override
  Widget build(BuildContext context) {
    var category = CategoryRepository.getCategory(cantidad);

    return Scaffold(
      body: ListView.builder(
        itemCount: category.length,
        itemBuilder: ((context, index) => createItemList(context, category[index])),
      ),
    );
  }
  
  createItemList(BuildContext context,Category category) => ListTile(
    title: Text(category.nameCategory),
    subtitle: Text(category.description),
    trailing: displayImage(context, category.imageURL),
    onTap: () => Navigator.pushNamed(context, '/store_page_${category.id}'),
  );
  
  displayImage(BuildContext context, String imageURL) => FadeInImage.assetNetwork(placeholder: 'image/loading.gif', image: imageURL);


}

