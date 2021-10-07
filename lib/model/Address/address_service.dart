import 'package:http/http.dart' as http;
import 'package:rentalz_app/model/Address/address_model.dart';

class AddressService {
  static var client = http.Client();

  static Future<Province?> fetchProvince() async {
    var response =
        await client.get(Uri.parse('https://vapi.vnappmob.com/api/province/'));

    if (response.statusCode == 200) {
      var json = response.body;
      return provinceFromJson(json);
    } else {
      return null;
    }
  }

  static Future<District?> fetchDistrict(String district) async {
    var response = await client.get(
        Uri.parse('https://vapi.vnappmob.com/api/province/district/$district'));

    if (response.statusCode == 200) {
      var json = response.body;
      return districtFromJson(json);
    } else {
      return null;
    }
  }

  static Future<Ward?> fetchWard(String ward) async {
    var response = await client
        .get(Uri.parse('https://vapi.vnappmob.com/api/province/ward/$ward'));

    if (response.statusCode == 200) {
      var json = response.body;
      return wardFromJson(json);
    } else {
      return null;
    }
  }
}
