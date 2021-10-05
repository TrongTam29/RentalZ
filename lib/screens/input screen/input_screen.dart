import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            child: Container(
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
