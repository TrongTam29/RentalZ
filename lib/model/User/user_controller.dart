import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:rentalz_app/model/User/user_model.dart';
import 'package:rentalz_app/model/User/user_service.dart';

class UserController extends GetxController {
  var isLoading = true.obs;
  Rx<User> userObj = User().obs;
  var isRegisterLoading = true.obs;

  Future<User?> findUser(int id) async {
    try {
      isLoading(true);
      var user = await UserService.findUser(id);
      if (user != null) {
        return user;
      }
    } finally {
      isLoading(false);
    }
  }

  Future<bool?> login(String email, String password) async {
    var user = await UserService.login(email, password);
    if (user != null) {
      userObj.value = user;
      return true;
    } else
      return false;
  }

  Future<bool> register(String name, String email, String password) async {
    var user = await UserService.createUser(name, email, password);
    print(user!.statusCode);
    if (user.statusCode == 201) {
      return true;
    } else
      return false;
  }

  Future<void> updateImage(int id, String image) async {
    await UserService.updateImage(id, image);
    var user = await UserService.findUser(id);
    if (user != null) {
      userObj.value = user;
    }
  }
}
