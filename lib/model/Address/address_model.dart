// To parse this JSON data, do
//
//     final Province = ProvinceFromJson(jsonString);

import 'dart:convert';

List<Province> provinceFromJson(String str) =>
    List<Province>.from(json.decode(str).map((x) => Province.fromJson(x)));

Province provinceModelFromJson(String str) =>
    Province.fromJson(json.decode(str));

String provinceToJson(List<Province> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Province {
  Province({
    this.name,
    this.code,
    this.divisionType,
    this.codename,
    this.phoneCode,
    this.districts,
  });

  String? name;
  int? code;
  String? divisionType;
  String? codename;
  int? phoneCode;
  List<dynamic>? districts;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        name: json["name"],
        code: json["code"],
        divisionType: json["division_type"],
        codename: json["codename"],
        phoneCode: json["phone_code"],
        districts: List<dynamic>.from(json["districts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "division_type": divisionType,
        "codename": codename,
        "phone_code": phoneCode,
        "districts": List<dynamic>.from(districts!.map((x) => x)),
      };
}

List<District> districtFromJson(String str) =>
    List<District>.from(json.decode(str).map((x) => District.fromJson(x)));

District districtModelFromJson(String str) =>
    District.fromJson(json.decode(str));

String districtToJson(List<District> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class District {
  District({
    this.name,
    this.code,
    this.divisionType,
    this.codename,
    this.phoneCode,
    this.districts,
  });

  String? name;
  int? code;
  String? divisionType;
  String? codename;
  int? phoneCode;
  List<dynamic>? districts;

  factory District.fromJson(Map<String, dynamic> json) => District(
        name: json["name"],
        code: json["code"],
        divisionType: json["division_type"],
        codename: json["codename"],
        phoneCode: json["phone_code"],
        districts: List<dynamic>.from(json["districts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "division_type": divisionType,
        "codename": codename,
        "phone_code": phoneCode,
        "districts": List<dynamic>.from(districts!.map((x) => x)),
      };
}

List<Ward> wardFromJson(String str) =>
    List<Ward>.from(json.decode(str).map((x) => Ward.fromJson(x)));

Ward wardModelFromJson(String str) => Ward.fromJson(json.decode(str));

String wardToJson(List<Ward> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ward {
  Ward({
    this.name,
    this.code,
    this.divisionType,
    this.codename,
    this.districtCode,
  });

  String? name;
  int? code;
  String? divisionType;
  String? codename;
  int? districtCode;

  factory Ward.fromJson(Map<String, dynamic> json) => Ward(
        name: json["name"],
        code: json["code"],
        divisionType: json["division_type"],
        codename: json["codename"],
        districtCode: json["district_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "division_type": divisionType,
        "codename": codename,
        "district_code": districtCode,
      };
}
