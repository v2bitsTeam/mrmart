import 'package:MrMart/Controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("About Us"),
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
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: Container(
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
              height: 12.0,
            ),
            Text(
              "About Us: ",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            Text(
              "Visit our online supermarket store to buy grocery, daily needs, vegetables, fruits, cosmetics, toiletries, milk, housekeeping products, and much more ...",
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "We deliver best products in a less time.",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "About the company: ",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            Divider(),
            Text(
              "MR MART, Registered in 2020 at Hyderabad in Telangana, is leading Distributor of in India. MR MART is one of Trade India's verified and trusted sellers of listed products. With their extensive experience of supplying and trading , MR MART has made a reputed name for themselves in the market with high quality etc. Focusing on a customer centric approach, MR MART has a pan-India presence and caters to a huge consumer base throughout the country. Buy in bulk from MR MART at Trade India quality-assured products.",
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
