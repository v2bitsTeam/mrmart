import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:get/get.dart';
import 'package:MrMart/Controllers/cart_controller.dart';

class ReturnAndRefundPolicyScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Return & Refund Policy"),
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
            padding: EdgeInsets.only(
              right: 24.0,
              top: 4.0,
            ),
            child: Container(
              width: 35,
              height: 35,
              child: Obx(
                () => Stack(
                  children: [
                    Positioned(
                      top: 14.0,
                      left: 0,
                      child: InkWell(
                        child: SvgPicture.asset('assets/icons/cart_white.svg'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          cartController.cart.length.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Container(
                child: Image.asset(
                  'assets/images/checkout/checkout_header_image.png',
                  fit: BoxFit.fill,
                ),
              ),*/
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          color: Colors.grey[200],
          padding: EdgeInsets.only(
            top: 4.0,
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo-orange.png',
                  height: 40.0,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All items are 100 % non-weak and sway safe.",
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Still on the off chance that you didn't care for the item , we are available to supplant/Refund in the event that you transport us back . Return Logistics will be borne by client if the item isn't imperfect or harmed.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "This thing is qualified with the expectation of complimentary substitution, inside 10 days of conveyance, in a far-fetched occasion of harmed, deficient or unique/wrong thing conveyed to you.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "If you don't mind keep the thing in its unique condition, unique bundling, with client manual, guarantee cards, and unique embellishments in maker bundling for a fruitful return.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "In the event that you report an issue with your Furniture or Planter ,we may plan a professional visit to your area. Based on the expert's assessment report, we will give goal.",
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(
                thickness: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
