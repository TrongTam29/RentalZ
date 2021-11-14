import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/house/house_model.dart';

class HouseService {
  static var client = http.Client();

  static Future<List<House>?> fetchHouse() async {
    var response = await client.get(Uri.parse('$baseUrl/house/house'));

    if (response.statusCode == 200) {
      var json = response.body;
      return houseFromJson(json);
    } else {
      return null;
    }
  }

  static Future<http.Response?> deleteHouse(int id) async {
    var response = await client.delete(
      Uri.parse('$baseUrl/house/delete-house?id=$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }

  static Future<http.Response?> postHouse(
      String name,
      String price,
      String type,
      String city,
      String address,
      String furnitureType,
      int bedroom,
      int toilet,
      int diningroom,
      List<String> image,
      String detail,
      int userId) async {
    Map data = {
      "name": name,
      "price": price,
      "type": type,
      "city": city,
      "address": address,
      "furnitureType": furnitureType,
      "bedroom": bedroom,
      "toilet": toilet,
      "diningroom": diningroom,
      "image": image,
      "detail": detail,
      "userId": userId
    };
    var body = json.encode(data);
    http.Response response =
        await client.post(Uri.parse('$baseUrl/house/create-house'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }

  static Future<House?> findHouseByName(String name) async {
    var response =
        await client.get(Uri.parse('$baseUrl/house/find-house?name=$name'));

    if (response.statusCode == 200) {
      var json = response.body;
      return houseModelFromJson(json);
    } else {
      return null;
    }
  }

  static Future<http.Response?> updateHouse(
      int id,
      String name,
      String price,
      String type,
      String city,
      String address,
      String furnitureType,
      int bedroom,
      int toilet,
      int diningroom,
      List<String> image,
      String detail,
      int userId) async {
    Map data = {
      "name": name,
      "price": price,
      "type": type,
      "city": city,
      "address": address,
      "furnitureType": furnitureType,
      "bedroom": bedroom,
      "toilet": toilet,
      "diningroom": diningroom,
      "image": image,
      "detail": detail,
      "userId": userId,
    };
    var body = json.encode(data);
    http.Response response =
        await client.put(Uri.parse('$baseUrl/house/update-house/$id'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: body);

    return response;
  }

  static Future<List<House>?> findById(int id) async {
    var response =
        await client.get(Uri.parse('$baseUrl/house/find-house-by-id?id=$id'));

    if (response.statusCode == 200) {
      var json = response.body;
      return houseFromJson(json);
    } else {
      return null;
    }
  }

  static Future<List<House>?> fillter(
      String type, String furniture, String city) async {
    var response;
    if (type != '' && furniture != '' && city == '') {
      response = await client.get(Uri.parse(
          '$baseUrl/house/fillter-house?type=$type&furniture=$furniture'));
    } else if (type != '' && furniture == '' && city != '') {
      response = await client
          .get(Uri.parse('$baseUrl/house/fillter-house?type=$type&city=$city'));
    } else if (type == '' && furniture != '' && city != '') {
      response = await client.get(Uri.parse(
          '$baseUrl/house/fillter-house?furniture=$furniture&city=$city'));
    } else if (type == '' && furniture == '' && city != '') {
      response = await client
          .get(Uri.parse('$baseUrl/house/fillter-house?city=$city'));
    } else if (type == '' && furniture != '' && city == '') {
      response = await client
          .get(Uri.parse('$baseUrl/house/fillter-house?furniture=$furniture'));
    } else if (type != '' && furniture == '' && city == '') {
      response = await client
          .get(Uri.parse('$baseUrl/house/fillter-house?type=$type'));
    } else if (type != '' && furniture != '' && city != '') {
      response = await client.get(Uri.parse(
          '$baseUrl/house/fillter-house?type=$type&furniture=$furniture&city=$city'));
    }

    if (response.statusCode == 200) {
      var json = response.body;
      return houseFromJson(json);
    } else {
      return null;
    }
  }
}
