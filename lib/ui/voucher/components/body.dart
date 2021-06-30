import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:get/get.dart';
import 'package:MrMart/ui_components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Voucher',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1,
            ),
          ),
          //TitleWithClearAllBtn(text: "Today", press: () {}),
          SizedBox(
            height: 15,
          ),
          VoucherImageView(),
        ],
      ),
    );
  }
}

Widget VoucherImageView() {
  return ListView(
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    children: [
      Card(
        /*margin: EdgeInsets.only(
            top: (Get.height * 0.2),
            left: Dimension.Padding,
            right: Dimension.Padding,
            bottom: Dimension.Size_20),*/
        elevation: Dimension.card_elevation,
        clipBehavior: Clip.antiAlias,
        child: Container(
          padding: EdgeInsets.all(Dimension.Padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset('assets/images/voucher/bg_no_voucher.png'),
              SizedBox(
                height: Dimension.Size_10,
              ),
              Text(
                'There is no voucher, go collect \nvoucher now.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSubTextColor,
                  fontSize: kTextSizeSmall,
                ),
              ),
              SizedBox(
                height: Dimension.Size_10,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      /*    Padding(
        padding: const EdgeInsets.all(4.0),
        child: DefaultButton(
          text: "Collect Voucher",
          press: () {
            Get.toNamed(MY_VOUCHER_ALL_SCREEN);
          },
        ),
      ),*/
    ],
  );
}
