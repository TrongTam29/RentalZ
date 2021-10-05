import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/model/Address/address_controller.dart';

class ProvinceSceen extends StatefulWidget {
  ProvinceSceen({Key? key}) : super(key: key);

  @override
  _ProvinceSceenState createState() => _ProvinceSceenState();
}

class _ProvinceSceenState extends State<ProvinceSceen> {
  AddressController addressController = Get.put(AddressController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () {
            if (addressController.isLoading.value)
              return Center(
                child: CupertinoActivityIndicator(),
              );
            else
              return ListView.builder(
                itemCount: addressController.provinceList.length,
                itemBuilder: (context, index) {
                  return Text(
                    addressController.provinceList[index].name!,
                    style: TextStyle(fontFamily: 'Poppins-Light'),
                  );
                },
              );
          },
        ),
      ),
    );
  }
}
