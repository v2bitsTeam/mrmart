import 'package:flutter/material.dart';
import 'components/messageBody.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:MrMart/ui/message/components/messageBody.dart';
import 'package:MrMart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/ui/notification/notification_screen.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MessageBody();
    /*Scaffold(
      */ /*appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Message"),
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
          preferredSize: Size.fromHeight(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              */ /**/ /*Container(
                child: Image.asset(
                  'assets/images/checkout/checkout_header_image.png',
                  fit: BoxFit.fill,
                ),
              ),*/ /**/ /*
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),*/ /*
      body: MessageBody(),
    );*/
  }
}
