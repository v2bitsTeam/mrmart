import 'package:mr_mart/Controllers/cart_controller.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:get/get.dart';
import 'package:mr_mart/ui/cart/components/body.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
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
            padding: EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Icon(
                Icons.home,
                size: 28.0,
              ),
              onPressed: () => Get.toNamed(MAIN_PAGE),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
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
      body: Body(),
    );
  }
}
