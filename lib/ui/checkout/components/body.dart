import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/ui_components/default_button.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:get/get.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, .0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Checkout Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, .0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  child: ExpansionTile(
                    title: Text("Recepients Details"),
                    subtitle: Text(
                      "Rahul Subramaniam-096 987 56 7890-2025 M Street, 3rd Blok Northwest, california, DC, 20036.",
                      style: TextStyle(color: Themes.subText),
                    ),
                    leading: ShapeOfView(
                      height: 50,
                      width: 50,
                      shape: RoundRectShape(
                        borderRadius: BorderRadius.circular(5),
                        borderColor: Colors.black, //optional
                        borderWidth: 0, //optional
                      ),
                      child: Container(
                        color: Themes.bG1,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                              'assets/icons/checkout/person.svg',
                              color: Colors.white,
                              semanticsLabel: ''),
                        ),
                      ),
                    ),
                    children: <Widget>[
                      IconTheme(
                        data: IconThemeData(
                          color: Colors.amber,
                          size: 32,
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Text(
                                'Name',
                                style: TextStyle(
                                  color: Themes.formFieldUpperText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Themes.formFieldBorder,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "your name",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(.2),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Text(
                                'Phone',
                                style: TextStyle(
                                  color: Themes.formFieldUpperText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Themes.formFieldBorder,
                                    ),
                                  ),
                                ),
                                child: TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "your phone number",
                                    hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(.2),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(16),
                              child: Expanded(
                                child: Container(
                                    child: Center(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              height: 45,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  elevation: 1,
                                                  primary: Themes.primary3,
                                                ),
                                                child: Text(
                                                  "No",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 45,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5.0,
                                                    ),
                                                  ),
                                                  elevation: 1,
                                                  primary: Themes.primary2,
                                                ),
                                                child: Text(
                                                  "Save Changes",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: Text("Delivery Info"),
                    trailing: Text(''),
                    subtitle: Text(
                      "Delivery time - 20 June2020 - (09.00am - 12.00pm)",
                      style: TextStyle(color: Themes.subText),
                    ),
                    leading: ShapeOfView(
                      height: 50,
                      width: 50,
                      shape: RoundRectShape(
                        borderRadius: BorderRadius.circular(5),
                        borderColor: Colors.black, //optional
                        borderWidth: 0, //optional
                      ),
                      child: Container(
                        color: Themes.bG2,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/checkout/car.svg',
                            color: Colors.white,
                            semanticsLabel: '',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  child: ExpansionTile(
                    title: Text("Payment Method"),
                    subtitle: Text(".... .... .... 0987"),
                    leading: ShapeOfView(
                      height: 50,
                      width: 50,
                      shape: RoundRectShape(
                        borderRadius: BorderRadius.circular(5),
                        borderColor: Colors.black, //optional
                        borderWidth: 0, //optional
                      ),
                      child: Container(
                        color: Themes.bG3,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/checkout/bank_card.svg',
                            color: Colors.white,
                            semanticsLabel: '',
                          ),
                        ),
                      ),
                    ),
                    children: <Widget>[
                      IconTheme(
                        data: IconThemeData(
                          color: Colors.amber,
                          size: 32,
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  ExpansionTile(
                                    title: Text("Rahul Subramaniam"),
                                    trailing: Text(''),
                                    subtitle: Text(
                                      ".... .... .... 0987)",
                                      style: TextStyle(color: Themes.subText),
                                    ),
                                    leading: ShapeOfView(
                                      height: 50,
                                      width: 50,
                                      shape: RoundRectShape(
                                        borderRadius: BorderRadius.circular(5),
                                        borderColor: Colors.black, //optional
                                        borderWidth: 0, //optional
                                      ),
                                      child: Container(
                                        color: Themes.bG4,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/checkout/mastercard.svg',
                                            color: Colors.white,
                                            semanticsLabel: '',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Column(
                                children: [
                                  ExpansionTile(
                                    title: Text("Rahul Subramaniam"),
                                    trailing: Text(''),
                                    subtitle: Text(
                                      ".... .... .... 0987)",
                                      style: TextStyle(color: Themes.subText),
                                    ),
                                    leading: ShapeOfView(
                                      height: 50,
                                      width: 50,
                                      shape: RoundRectShape(
                                        borderRadius: BorderRadius.circular(5),
                                        borderColor: Colors.black, //optional
                                        borderWidth: 0, //optional
                                      ),
                                      child: Container(
                                        color: Themes.bG5,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/checkout/paypal.svg',
                                            color: Colors.white,
                                            semanticsLabel: '',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Column(
                                children: [
                                  ExpansionTile(
                                    title: Text("Rahul Subramaniam"),
                                    subtitle: Text(
                                      ".... .... .... 0987)",
                                      style: TextStyle(color: Themes.subText),
                                    ),
                                    leading: ShapeOfView(
                                      height: 50,
                                      width: 50,
                                      shape: RoundRectShape(
                                        borderRadius: BorderRadius.circular(5),
                                        borderColor: Colors.black, //optional
                                        borderWidth: 0, //optional
                                      ),
                                      child: Container(
                                        color: Themes.bG6,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/checkout/visa.svg',
                                            color: Colors.white,
                                            semanticsLabel: '',
                                          ),
                                        ),
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.check_circle,
                                      color: kPrimaryColor,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Column(
                                children: [
                                  ExpansionTile(
                                    title: Text("Add New Card"),
                                    trailing: Text(''),
                                    subtitle: Text(
                                      " ",
                                      style: TextStyle(color: Themes.subText),
                                    ),
                                    leading: ShapeOfView(
                                      height: 50,
                                      width: 50,
                                      shape: RoundRectShape(
                                        borderRadius: BorderRadius.circular(5),
                                        borderColor: Colors.black, //optional
                                        borderWidth: 0, //optional
                                      ),
                                      child: Container(
                                        color: Themes.bG7,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/checkout/add.svg',
                                            color: Colors.white,
                                            semanticsLabel: '',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DefaultButton(
                    text: "Proceed To Cart Summary",
                    press: () => Get.toNamed(CART_SUMMARY_SCREEN),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
