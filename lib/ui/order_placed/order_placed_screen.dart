import 'package:mr_mart/ui/order_placed/components/body.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:get/get.dart';

class OrderPlacedScreen extends StatelessWidget {
  final String orderId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text("Order Placed"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("assets/images/checkout/checkout_header_bg.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(190),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/images/checkout/checkout_header_image.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
      body: Body(orderId),
    );
  }
}
