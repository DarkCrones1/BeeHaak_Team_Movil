
import 'package:bee_haak_app/Providers/category_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dtos/responses/category_responses_dto.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Consumer<CategoryProvider>(builder: (context, categoryProvider, child) => categoryProvider.isloading ? const Center(child: CircularProgressIndicator())
          :Expanded(
            child: ListView.builder(
              itemCount: categoryProvider.category?.length,
              itemBuilder: ((context, index) => createItemList(context, categoryProvider.category![index])),
            ),
          ))
        ],
      ),
    );
  }

  createItemList(BuildContext context,CategoryResponseDto category) => ListTile(
    title: Text(category.name),
    subtitle: Text(category.description),
    trailing: displayImage(context, category.imageURL),
    // trailing: displayImage(context,),
    onTap: () => Navigator.pushNamed(context, '/store_page_${category.name}'),
    // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PageNature(nameCategory: category[]),
  );
  
  // displayImage(BuildContext context, )=> FadeInImage.assetNetwork(placeholder: 'image/loading.gif', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU');
  displayImage(BuildContext context, String imageURL) => FadeInImage.assetNetwork(placeholder: 'image/loading.gif', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU');
}

