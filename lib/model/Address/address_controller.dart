import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:rentalz_app/model/Address/address_model.dart';
import 'package:rentalz_app/model/Address/address_service.dart';

class AddressController extends GetxController {
  var isLoading = true.obs;
  var isLoadingfindCardioByLink = true.obs;
  RxList<Province> provinceList = RxList();

  @override
  void onInit() {
    super.onInit();
    fetchProvince();
  }

  void fetchProvince() async {
    try {
      isLoading(true);
      var provinces = await AddressService.fetchProvice();
      if (provinces != null) {
        provinceList.value = provinces;
      }
    } finally {
      isLoading(false);
    }
  }
}
