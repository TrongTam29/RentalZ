// To parse this JSON data, do
//
//     final house = houseFromJson(jsonString);

import 'dart:convert';

import 'dart:io';

List<House> houseFromJson(String str) =>
    List<House>.from(json.decode(str).map((x) => House.fromJson(x)));
House houseModelFromJson(String str) => House.fromJson(json.decode(str));

String houseToJson(List<House> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class House {
  House({
    this.id,
    this.name,
    this.price,
    this.type,
    this.city,
    this.address,
    this.furnitureType,
    this.bedroom,
    this.toilet,
    this.diningroom,
    this.image,
    this.detail,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? price;
  String? type;
  String? city;
  String? address;
  String? furnitureType;
  int? bedroom;
  int? toilet;
  int? diningroom;
  List<String>? image;
  String? detail;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory House.fromJson(Map<String, dynamic> json) => House(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        type: json["type"],
        city: json["city"],
        address: json["address"],
        furnitureType: json["furnitureType"],
        bedroom: json["bedroom"],
        toilet: json["toilet"],
        diningroom: json["diningroom"],
        image: List<String>.from(json["image"].map((x) => x)),
        detail: json["detail"],
        userId: json["userId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "type": type,
        "city": city,
        "address": address,
        "furnitureType": furnitureType,
        "bedroom": bedroom,
        "toilet": toilet,
        "diningroom": diningroom,
        "image": List<String>.from(image!.map((x) => x)),
        "detail": detail,
        "userId": userId,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
