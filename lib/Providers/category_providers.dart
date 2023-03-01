
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../dtos/responses/category_responses_dto.dart';

class CategoryProvider extends ChangeNotifier {
  
  final logger = Logger();
  List<CategoryResponseDto>? _category;
  bool isloading = true;
  List<CategoryResponseDto>? get category => _category;

  Future fetchCategory() async {
    final response = await http.get(Uri.parse('http://localhost:5042/API_Bee_Haak/Category'));
    // final response = await http.get(Uri.parse('hhttps://beehaakapi-production.up.railway.app/bee/Categoria'));

    logger.d(response.statusCode);
    logger.d(response.body);
    if (response.statusCode == 200){
      final json = jsonDecode(response.body);

      // final data = List.from(json);
      final List<dynamic> data = json;
      // AQUI SE Moria
      _category = data.map((category) => CategoryResponseDto.fromJson(category)).toList();

      isloading = false;
      notifyListeners();
    } else {
      throw Exception('Failer to load');
    }
  } 

}