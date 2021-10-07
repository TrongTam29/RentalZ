import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/Address/address_controller.dart';
import 'package:rentalz_app/model/Address/address_model.dart';
import 'package:rentalz_app/screens/input%20screen/components/image_picker.dart';

class InputScreen extends StatefulWidget {
  InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  List kindOfHouse = ['House', 'Flat', 'Bungalow', 'Apartment', 'Official'];
  List quantityRooms = [0, 1, 2, 3, 4, 5];
  List furniturelist = ['Furnished', 'Part Furnished', ' Unfurnished'];
  String? furniture;
  String? kindDropdown;
  int? bedroom = 1;
  int? toilet = 1;
  int? kitchen = 1;
  AddressController addressController = Get.put(AddressController());
  String? province;
  String? district;
  String? ward;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Home')),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Obx(
              () => Container(
                margin: EdgeInsets.only(top: 20),
                width: size.width * 0.9 + 20,
                child: Column(
                  children: [
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(
                        Icons.home_rounded,
                        size: 26,
                      ),
                      title: Container(
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Name*',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(
                        Icons.attach_money_rounded,
                        size: 26,
                      ),
                      title: Container(
                        height: 40,
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Prices/month*',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(Icons.format_list_numbered_rounded),
                      title: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            isExpanded: true,
                            hint: Text(
                              'Kinds of House*',
                              style: TextStyle(fontSize: 16),
                            ),
                            value: kindDropdown,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppin-Light'),
                            onChanged: (newValue) {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              setState(() {
                                kindDropdown = newValue!;
                              });
                            },
                            items: kindOfHouse.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(Icons.chair_alt_rounded),
                      title: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            isExpanded: true,
                            hint: Text(
                              'Furniture types*',
                              style: TextStyle(fontSize: 16),
                            ),
                            value: furniture,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppin-Light'),
                            onChanged: (newValue) {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              setState(() {
                                furniture = newValue!;
                              });
                            },
                            items: furniturelist.map((value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 18),
                        Icon(Icons.king_bed_outlined),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5, right: 15),
                            padding: EdgeInsets.only(left: 10),
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                alignment: AlignmentDirectional.center,
                                isExpanded: true,
                                hint: Text(
                                  'Num',
                                  style: TextStyle(fontSize: 16),
                                ),
                                value: bedroom,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Poppin-Light'),
                                onChanged: (newValue) {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  setState(() {
                                    bedroom = newValue!;
                                  });
                                },
                                items: quantityRooms.map((value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.bathtub_outlined),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5, right: 15),
                            padding: EdgeInsets.only(left: 10),
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                alignment: AlignmentDirectional.center,
                                isExpanded: true,
                                hint: Text(
                                  'Num',
                                  style: TextStyle(fontSize: 16),
                                ),
                                value: toilet,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Poppin-Light'),
                                onChanged: (newValue) {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  setState(() {
                                    toilet = newValue!;
                                  });
                                },
                                items: quantityRooms.map((value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Icon(Icons.restaurant_outlined),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 5, right: 15),
                            padding: EdgeInsets.only(left: 10),
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<int>(
                                alignment: AlignmentDirectional.center,
                                isExpanded: true,
                                hint: Text(
                                  'Num',
                                  style: TextStyle(fontSize: 16),
                                ),
                                value: kitchen,
                                icon: const Icon(Icons.arrow_downward),
                                iconSize: 24,
                                elevation: 16,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Poppin-Light'),
                                onChanged: (newValue) {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  setState(() {
                                    kitchen = newValue!;
                                  });
                                },
                                items: quantityRooms.map((value) {
                                  return DropdownMenuItem<int>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(Icons.location_city_rounded),
                      title: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            isExpanded: true,
                            hint: Text(
                              'Provine/City*',
                              style: TextStyle(fontSize: 16),
                            ),
                            value: province,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppin-Light'),
                            onChanged: (newValue) {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              setState(() {
                                province = newValue!;
                              });
                            },
                            items: addressController.provinceList
                                .map((ProvinceResult value) {
                              return DropdownMenuItem<String>(
                                value: value.provinceId,
                                onTap: () => addressController
                                    .fetchDistrict(value.provinceId!),
                                child: Text(value.provinceName!),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(Icons.maps_home_work_rounded),
                      title: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            isExpanded: true,
                            hint: Text(
                              'District*',
                              style: TextStyle(fontSize: 16),
                            ),
                            value: district,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppin-Light'),
                            onChanged: (newValue) {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              setState(() {
                                district = newValue!;
                              });
                            },
                            items: addressController.districtList
                                .map((DistrictResult value) {
                              return DropdownMenuItem<String>(
                                value: value.districtId,
                                onTap: () => addressController
                                    .fetchWard(value.districtId!),
                                child: Text(value.districtName!),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(Icons.home_rounded),
                      title: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            alignment: AlignmentDirectional.center,
                            isExpanded: true,
                            hint: Text(
                              'Wards*',
                              style: TextStyle(fontSize: 16),
                            ),
                            value: ward,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Poppin-Light'),
                            onChanged: (newValue) {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              setState(() {
                                ward = newValue!;
                              });
                            },
                            items: addressController.wardList
                                .map((WardResult value) {
                              return DropdownMenuItem<String>(
                                value: value.wardId,
                                child: Text(value.wardName!),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(
                        Icons.location_on,
                        size: 26,
                      ),
                      title: Container(
                        height: 40,
                        child: TextFormField(
                          cursorColor: kSecondaryColor,
                          decoration: InputDecoration(
                            labelText: 'Address*',
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    PickImage(),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      minLeadingWidth: 1,
                      leading: Icon(Icons.info_rounded),
                      title: TextFormField(
                        minLines: 3,
                        maxLines: 6,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Post',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 120)),
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.white))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
