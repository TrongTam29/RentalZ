import 'package:http/http.dart' as http;
import 'package:rentalz_app/model/Address/address_model.dart';

class AddressService {
  static var client = http.Client();

  static Future<List<Province>?> fetchProvice() async {
    var response = await client.get(
      Uri.parse('https://provinces.open-api.vn/api/p/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return provinceFromJson(json);
    } else {
      return null;
    }
  }
}
