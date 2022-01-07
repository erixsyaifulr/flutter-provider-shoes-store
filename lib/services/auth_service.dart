import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // String baseUrl = 'http://192.168.1.26:8000/api';
  String baseUrl = 'http://192.168.43.125:8000/api';
  Future<UserModel> register({
    String name,
    String username,
    String email,
    String password,
  }) async {
    var url = '$baseUrl/register';
    var header = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = data['access_token'];

      return user;
    } else {
      throw Exception('Gagal register');
    }
  }

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl/login';
    var header = {'Content-type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = data['access_token'];

      return user;
    } else {
      throw Exception('Gagal login');
    }
  }
}
