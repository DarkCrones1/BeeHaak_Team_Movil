

import 'package:bee_haak_app/core/entities/category.dart';

class CategoryRepository{

  static List<Category> getCategory(int cantidad) => List.generate(cantidad, (index) => Category(id: index+1, nameCategory: '${index+1}', description: 'Description ${index+1}', imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU'));

}