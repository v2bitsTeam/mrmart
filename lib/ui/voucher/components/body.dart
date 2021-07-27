import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/app_components/Dimension.dart';

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
          SizedBox(
            height: 15,
          ),
          voucherImageView(),
        ],
      ),
    );
  }
}

Widget voucherImageView() {
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
              SizedBox(
                height: 40,
              ),
              Image.asset('assets/images/voucher/bg_no_voucher.png'),
              SizedBox(
                height: Dimension.size10,
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
                height: Dimension.size10,
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
