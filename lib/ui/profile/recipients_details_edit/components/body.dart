import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:get/get.dart';
import 'package:mr_mart/ui_components/DefaultTextFieldProfileEditClicked.dart';
import 'package:mr_mart/ui_components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Positioned(
            top: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, .0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Recipients Details',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        height: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Text(
                        "Edit",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Themes.primary2,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 1,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          recipientsDetailsView(),
        ],
      ),
    );
  }
}

Widget recipientsDetailsView() {
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    children: [
      Card(
        elevation: Dimension.cardElevation,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(Dimension.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              defaultTextFieldProfileEditClicked(
                  controller: null, label: 'Name'),
              defaultTextFieldProfileEditClicked(
                  controller: null, label: 'EMail'),
              defaultTextFieldProfileEditClicked(
                  controller: null, label: 'Phone'),
              SizedBox(
                height: Dimension.size10,
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: DefaultButton(
          text: "Save Changes",
          press: () => Get.toNamed(PROFILE_SCREEN),
        ),
      ),
    ],
  );
}
