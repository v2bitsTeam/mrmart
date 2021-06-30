import 'package:MrMart/ui/order/order_history/tabs/TabPastOrderScreen.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/ui/profile/followed_shop/components/body.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:MrMart/ui/checkout/checkout_screen.dart';
import 'package:MrMart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/ui/notification/notification_screen.dart';

class FollowedShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/profile/profile_header_bg.png"),
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
                  MaterialPageRoute(builder: (context) => CartScreen()),
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
          preferredSize: Size.fromHeight(190),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    AssetImage('assets/images/profile/profile.jpg'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Rahul Subramaniam',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'pacifico'),
              ),
              Text(
                'rahulsubramaniam@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
      body: TabPastOrderScreen(),
    );
  }
}
