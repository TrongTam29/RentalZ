import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:get/state_manager.dart';
import 'package:rentalz_app/model/house/house_model.dart';
import 'package:rentalz_app/model/house/house_service.dart';

class HouseController extends GetxController {
  var isSuccessful = false.obs;
  var isLoading = true.obs;
  var isFindHouseLoading = true.obs;
  var isFindHouseByIdLoading = true.obs;
  var isPostHouseLoading = true.obs;
  var isFillterHouseLoading = true.obs;
  RxList<House> houseList = RxList();
  RxList<House> findHouseList = RxList();
  RxList<House> findHouseByIdList = RxList();
  RxList<House> fillterHouseList = RxList();

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<House>?> fetchHouse() async {
    try {
      isLoading(true);
      var houses = await HouseService.fetchHouse();
      if (houses != null) {
        houseList.value = houses;
      }
      return houseList;
    } finally {
      isLoading(false);
    }
  }

  Future<bool?> postHouse(
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
    var house = await HouseService.postHouse(name, price, type, city, address,
        furnitureType, bedroom, toilet, diningroom, image, detail, userId);
    print(house!.statusCode);
    if (house.statusCode == 201) {
      return true;
    } else
      return false;
  }

  Future<House?> findHouse(String name) async {
    try {
      isFindHouseLoading(true);
      var houses = await HouseService.findHouseByName(name);
      if (houses != null) {
        return houses;
      }
    } finally {
      isFindHouseLoading(false);
    }
  }

  Future<bool?> deleteHouse(int id) async {
    var response = await HouseService.deleteHouse(id);

    if (response!.statusCode == 201) {
      return true;
    } else
      return false;
  }

  Future<bool?> updateHouse(
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
    var response = await HouseService.updateHouse(
        id,
        name,
        price,
        type,
        city,
        address,
        furnitureType,
        bedroom,
        toilet,
        diningroom,
        image,
        detail,
        userId);
    if (response!.statusCode == 201) {
      return true;
    } else
      return false;
  }

  Future<List<House>?> findHouseById(int id) async {
    try {
      isFindHouseByIdLoading(true);
      var housess = await HouseService.findById(id);
      if (housess != null) {
        findHouseByIdList.value = housess;
      }
      return findHouseList;
    } finally {
      isFindHouseByIdLoading(false);
    }
  }

  Future<List<House>> fillterHouse(
      String type, String furniture, String city) async {
    try {
      isFillterHouseLoading(true);
      var houses = await HouseService.fillter(type, furniture, city);

      fillterHouseList.value = houses!;

      return fillterHouseList;
    } finally {
      isFillterHouseLoading(false);
    }
  }
}
