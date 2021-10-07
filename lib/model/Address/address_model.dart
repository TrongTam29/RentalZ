// To parse this JSON data, do
//
//     final province = provinceFromJson(jsonString);

import 'dart:convert';

Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  Province({
    this.results,
  });

  List<ProvinceResult>? results;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        results: List<ProvinceResult>.from(
            json["results"].map((x) => ProvinceResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class ProvinceResult {
  ProvinceResult({
    this.provinceId,
    this.provinceName,
    this.provinceType,
  });

  String? provinceId;
  String? provinceName;
  String? provinceType;

  factory ProvinceResult.fromJson(Map<String, dynamic> json) => ProvinceResult(
        provinceId: json["province_id"],
        provinceName: json["province_name"],
        provinceType: json["province_type"],
      );

  Map<String, dynamic> toJson() => {
        "province_id": provinceId,
        "province_name": provinceName,
        "province_type": provinceType,
      };
}

District districtFromJson(String str) => District.fromJson(json.decode(str));

String districtToJson(District data) => json.encode(data.toJson());

class District {
  District({
    this.results,
  });

  List<DistrictResult>? results;

  factory District.fromJson(Map<String, dynamic> json) => District(
        results: List<DistrictResult>.from(
            json["results"].map((x) => DistrictResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class DistrictResult {
  DistrictResult({
    this.districtId,
    this.districtName,
    this.districtType,
    this.lat,
    this.lng,
    this.provinceId,
  });

  String? districtId;
  String? districtName;
  String? districtType;
  dynamic lat;
  dynamic lng;
  String? provinceId;

  factory DistrictResult.fromJson(Map<String, dynamic> json) => DistrictResult(
        districtId: json["district_id"],
        districtName: json["district_name"],
        districtType: json["district_type"],
        lat: json["lat"],
        lng: json["lng"],
        provinceId: json["province_id"],
      );

  Map<String, dynamic> toJson() => {
        "district_id": districtId,
        "district_name": districtName,
        "district_type": districtType,
        "lat": lat,
        "lng": lng,
        "province_id": provinceId,
      };
}

Ward wardFromJson(String str) => Ward.fromJson(json.decode(str));

String wardToJson(Ward data) => json.encode(data.toJson());

class Ward {
  Ward({
    this.results,
  });

  List<WardResult>? results;

  factory Ward.fromJson(Map<String, dynamic> json) => Ward(
        results: List<WardResult>.from(
            json["results"].map((x) => WardResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class WardResult {
  WardResult({
    this.districtId,
    this.wardId,
    this.wardName,
    this.wardType,
  });

  String? districtId;
  String? wardId;
  String? wardName;
  String? wardType;

  factory WardResult.fromJson(Map<String, dynamic> json) => WardResult(
        districtId: json["district_id"],
        wardId: json["ward_id"],
        wardName: json["ward_name"],
        wardType: json["ward_type"],
      );

  Map<String, dynamic> toJson() => {
        "district_id": districtId,
        "ward_id": wardId,
        "ward_name": wardName,
        "ward_type": wardType,
      };
}
