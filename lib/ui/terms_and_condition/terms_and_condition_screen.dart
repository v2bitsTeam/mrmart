import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:get/get.dart';
import 'package:MrMart/Controllers/cart_controller.dart';

class TermsAndConditionScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Terms and Condition"),
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
            SizedBox(height: 10.0),
            Text(
              'By visiting our site as well as buying something from us, you participate in our "Administration" and consent to be limited by the accompanying terms and conditions ("Terms of Service", "Terms"), including those extra terms and conditions and arrangements referred to in this or potentially accessible by hyperlink. These Terms of Service apply to all clients of the site, including without impediment clients who are programs, sellers, clients, traders, or potentially givers of substance.',
            ),
            SizedBox(height: 16.0),
            Text(
              "Any new highlights or instruments which are added to the current store will likewise be dependent upon the Terms of Service. You can survey the most current adaptation of the Terms of Service whenever on this page. We claim all authority to refresh, change or supplant any piece of these Terms of Service by posting refreshes or potentially changes to our site. It is your obligation to check this page occasionally for changes. Your proceeded with utilization of or admittance to the site following the posting of any progressions establishes acknowledgment of those changes.",
            ),
            SizedBox(height: 10.0),
            Divider(
              thickness: 1.0,
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/logo-large-orange.png',
                  height: 80.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
