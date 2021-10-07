import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:rentalz_app/model/Address/address_model.dart';
import 'package:rentalz_app/model/Address/address_service.dart';

class AddressController extends GetxController {
  var isLoading = true.obs;
  var isLoadingfindCardioByLink = true.obs;
  RxList<ProvinceResult> provinceList = RxList();
  RxList<DistrictResult> districtList = RxList();
  RxList<WardResult> wardList = RxList();

  @override
  void onInit() {
    super.onInit();
    fetchProvince();
  }

  void fetchProvince() async {
    try {
      isLoading(true);
      var provinces = await AddressService.fetchProvince();
      if (provinces != null) {
        provinceList.value = provinces.results!;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchDistrict(String districtId) async {
    try {
      isLoading(true);
      var district = await AddressService.fetchDistrict(districtId);
      if (district != null) {
        districtList.value = district.results!;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchWard(String wardID) async {
    try {
      isLoading(true);
      var wards = await AddressService.fetchWard(wardID);
      if (wards != null) {
        wardList.value = wards.results!;
      }
    } finally {
      isLoading(false);
    }
  }
}
