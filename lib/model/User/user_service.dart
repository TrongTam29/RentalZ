import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/User/user_model.dart';

class UserService {
  static var client = http.Client();

  static Future<User?> findUser(int id) async {
    var response =
        await client.get(Uri.parse('$baseUrl/user/find-user?id=$id'));

    if (response.statusCode == 200) {
      var json = response.body;
      return userModelFromJson(json);
    } else
      return null;
  }

  static Future<User?> login(String email, String password) async {
    var response = await client
        .get(Uri.parse('$baseUrl/user/login?email=$email&password=$password'));

    if (response.statusCode == 200) {
      var json = response.body;
      return userModelFromJson(json);
    } else
      return null;
  }

  static Future<http.Response?> createUser(
      String name, String email, String password) async {
    Map data = {"name": name, "email": email, "password": password};
    var body = json.encode(data);
    var response = await client.post(Uri.parse('$baseUrl/user/create-user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: body);

    return response;
  }
}
