import 'dart:convert';
import 'package:bee_haak_app/dtos/responses/product_responses_dto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ProductNatureProvider extends ChangeNotifier {

  final logger = Logger();
  List<ProductResponseDto>? _productCategory;
  bool isloading = true;
  List<ProductResponseDto>? get product => _productCategory;


  Future fetchProductNature() async{
    final response = await http.get(Uri.parse('http://localhost:5042/API_Bee_Haak/Product/Category?category=Nature'));

    logger.d(response.statusCode);
    logger.d(response.body);

    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      final List<dynamic> data = json;

      _productCategory = data.map((product) => ProductResponseDto?.fromJson(product)).toList();

      isloading = false;
      notifyListeners();
    }else{
      throw Exception('Failer to load');
    }
  }
}