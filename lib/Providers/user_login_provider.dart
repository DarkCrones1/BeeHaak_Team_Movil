
// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:bee_haak_app/dtos/responses/user_response_dto.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginProvider extends ChangeNotifier{

  final logger = Logger();

  List<UserResponseDto>? _users;
  bool isloading = true;
  List<UserResponseDto>? get users => _users;

  Future fetchLogin() async{
    final response = await http.get(Uri.parse('uhttp://localhost:5042/API_Bee_Haak/Account/Users'));

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

  Future loginUser(String email, String password, BuildContext context) async{
    final user = UserResponseDto(email: email, password: password);

    final response = await http.post(
      Uri.parse('http://localhost:5042/API_Bee_Haak/Account/Login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user));

      if (response.statusCode == 200){
        if (context.mounted){
          final json = jsonDecode(response.body);
          final token = json['token'];
          // final claim = token['Rol'];
          // Guarda el token usando sharedpreferences
          final SharedPreferences shared = await SharedPreferences.getInstance();
          shared.setString('token', token);

          if (email == 'Ivan@gmail.com' || email == 'Lalo@gmail.com' || email == 'Pedro@gmail.com'){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Welcome Admin")));
          Navigator.restorablePushNamedAndRemoveUntil(context, '/home_admin_navbar', (route) => false);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Welcome  ${user.email}")));
          Navigator.restorablePushNamedAndRemoveUntil(context, '/home_user_navbar', (route) => false);
          }
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Email or password incorrect")));
      }
  }

}