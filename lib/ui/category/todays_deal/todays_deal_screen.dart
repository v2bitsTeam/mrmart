import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:mr_mart/ui/notification/notification_screen.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/Language/Language.dart';
import 'package:mr_mart/ui/category/todays_deal/components/TodaysDealBody.dart';

class TodaysDealScreen extends StatelessWidget {
  final Language language = Language();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text("Today's Deal"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/cart_white.svg'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartSummaryScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/notification.svg'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: TodaysDealBody(),
    );
  }
}
