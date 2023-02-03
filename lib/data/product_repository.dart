import 'package:bee_haak_app/core/entities/product.dart';

class ProductRepository{
  
  static List<Product> getProduct(int cantidad) => List.generate(cantidad, (index) =>  Product(id: index+1, category: 'Category ${index+1}', name: 'Product ${index+1}', description: 'Description ${index+1}', imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoXsJHSvQyODNWGPlVd6TstIV3Bkuo-m3-Ww&usqp=CAU'));
}