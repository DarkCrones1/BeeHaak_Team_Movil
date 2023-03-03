
import 'dart:convert';
import 'package:bee_haak_app/dtos/requests/user_create_request_dto.dart';
import 'package:bee_haak_app/dtos/responses/user_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier{

  final logger = Logger();

  List<UserResponseDto>? _users;
  bool isloading = true;
  List<UserResponseDto>? get users =>_users;

  Future fetchUsers() async {
    final response = await http.get(Uri.parse('http://localhost:5042/API_Bee_Haak/Account/Users'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> data = json['data'];

      _users = data.map((user) => UserResponseDto.fromJson(user)).toList();

      isloading = false;

      notifyListeners(); // Notificar cambios
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future createUser(String name, String email, String password, BuildContext context) async{
    final user = UserCreateRequestDto(email: email, password: password, name: name);

    final response = await http.post(
      Uri.parse('http://localhost:5042/API_Bee_Haak/Account/Register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user),
    );


    if (response.statusCode == 200) {
      logger.d('User created: ${response.body}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User created!')),
        );
        Navigator.pop(context);
      }
    } else {
      logger.e('Error: ${response.statusCode}');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}!')),
        );
      }
    }
  }

}