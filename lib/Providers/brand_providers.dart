
import 'dart:convert';

import 'package:bee_haak_app/dtos/responses/brand_responses_dto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class BrandProvider extends ChangeNotifier {
  
  final logger = Logger();
  List<BrandResponseDto>? _brand;
  bool isloading = true;
  List<BrandResponseDto>? get brand => _brand;

  Future fetchBrands() async {
    final response = await http.get(Uri.parse('http://localhost:5042/API_Bee_Haak/Brand'));

    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      final List<dynamic> data = json['data'];
      _brand = data.map((brand) => BrandResponseDto.fromJson(brand)).toList();

      isloading = false;

    } else {
      throw Exception('Failer to loead');
    }
  } 

}