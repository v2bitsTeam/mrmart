import 'package:flutter/material.dart';
import 'components/body.dart';

class CheckoutScreen extends StatelessWidget {
  //static String routeName = "/Checkout";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
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
      body: Body(),
    );
  }
}
