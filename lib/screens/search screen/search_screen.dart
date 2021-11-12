import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rentalz_app/components/house_widget.dart';
import 'package:rentalz_app/constants.dart';
import 'package:rentalz_app/model/Address/address_controller.dart';
import 'package:rentalz_app/model/Address/address_model.dart';
import 'package:rentalz_app/model/house/house_controller.dart';
import 'package:rentalz_app/screens/detail%20screen/house_detail.dart';
import 'package:rentalz_app/screens/search%20screen/search_delegate.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List kindOfHouse = [
    'none',
    'House',
    'Flat',
    'Bungalow',
    'Apartment',
    'Official'
  ];
  List furniturelist = ['none', 'Furnished', 'Part Furnished', ' Unfurnished'];
  AddressController addressController = Get.put(AddressController());
  HouseController houseController = Get.put(HouseController());
  String? province;
  String? furniture;
  String? kindDropdown;
  List<String>? listHouseName = [];

  @override
  void initState() {
    takeHouseName();
    super.initState();
  }

  void takeHouseName() {
    houseController.fetchHouse().then((houses) =>
        {for (var house in houses!) listHouseName!.add(house.name!)});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Search')),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            if (houseController.isLoading.value)
              return Center(
                child: CupertinoActivityIndicator(),
              );
            else
              return Column(
                children: [
                  Container(
                    height: size.height * 0.3,
                    width: size.width,
                    color: kSecondaryColor,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          height: 42,
                          width: size.width * 0.9 + 10,
                          child: GestureDetector(
                              onTap: () async {
                                final result = await showSearch<String>(
                                  context: context,
                                  delegate: NameSearch(listHouseName!),
                                );
                                houseController.findHouse(result!).then(
                                    (value) => Get.to(HouseDetail(
                                        name: value!.name!,
                                        type: value.type!,
                                        city: value.city!,
                                        address: value.address!,
                                        furnitureType: value.furnitureType!,
                                        bedroom: value.bedroom!,
                                        toilet: value.toilet!,
                                        diningroom: value.diningroom!,
                                        image: value.image!,
                                        userId: value.userId!,
                                        detail: value.detail!,
                                        createdAt: value.createdAt!,
                                        price: value.price!)));
                              },
                              child: Image.asset('assets/images/search.png',
                                  fit: BoxFit.fitWidth)),
                        ),
                        Center(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                padding: EdgeInsets.only(left: 10),
                                height: 40,
                                width: size.width * 0.4 + 15,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    color: kBackgroundColor),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    alignment: AlignmentDirectional.center,
                                    iconDisabledColor: kPrimaryColor,
                                    isExpanded: true,
                                    hint: Text(
                                      'Kinds of House',
                                      style: TextStyle(
                                          fontSize: 16, color: kSecondaryColor),
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
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                padding: EdgeInsets.only(left: 10),
                                height: 40,
                                width: size.width * 0.4 + 15,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(10),
                                    color: kBackgroundColor),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    alignment: AlignmentDirectional.center,
                                    isExpanded: true,
                                    hint: Text(
                                      'Furniture types',
                                      style: TextStyle(
                                          fontSize: 16, color: kSecondaryColor),
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
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          padding: EdgeInsets.only(left: 10),
                          height: 40,
                          width: size.width * 0.9 + 10,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                              color: kBackgroundColor),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              alignment: AlignmentDirectional.center,
                              isExpanded: true,
                              hint: Text(
                                'Provine/City',
                                style: TextStyle(
                                    fontSize: 16, color: kSecondaryColor),
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
                                  value: value.provinceName,
                                  onTap: () => addressController
                                      .fetchDistrict(value.provinceId!),
                                  child: Text(value.provinceName!),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {
                              if (kindDropdown == 'none') {
                                setState(() {
                                  kindDropdown = null;
                                });
                              }
                              if (furniture == 'none') {
                                setState(() {
                                  furniture = null;
                                });
                              }
                              houseController.fillterHouse(kindDropdown ?? '',
                                  furniture ?? '', province ?? '');
                            },
                            child: Text(
                              'Fillter',
                              style: TextStyle(fontSize: 16),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(horizontal: 60)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blueGrey),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.white))),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: houseController.fillterHouseList.length,
                    itemBuilder: (context, index) {
                      var house = houseController.houseList[index];
                      return HouseWidget(house: house, size: size);
                    },
                  ),
                ],
              );
          },
        ),
      ),
    );
  }
}
