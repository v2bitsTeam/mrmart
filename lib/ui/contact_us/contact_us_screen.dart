import 'package:MrMart/Controllers/cart_controller.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ContactUsScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text("Contact Us"),
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
              "Contact Us: ",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              height: 1.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Themes.Primary3,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Icon(Icons.room, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      "1ST FLOOR, SHANGRILA PLAZA, ROAD NO.2 , BANJARA HILLS, Hyderabad , Telangana , 500034.",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Themes.Text_Color,
                          ),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Themes.Primary,
                    ),
                    onTap: () async {
                      final url = 'https://goo.gl/maps/Lj5TBnYju4rH2RMv8';

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Themes.Primary3,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Icon(
                      Icons.phone,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      "+91 7406234567",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Themes.Text_Color,
                          ),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Themes.Primary,
                    ),
                    onTap: () async {
                      final url = 'tel:+917406234567';

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Themes.Primary3,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Icon(Icons.mail, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      "info@mrmart.co.in",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Themes.Text_Color,
                          ),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Themes.Primary,
                    ),
                    onTap: () async {
                      final url = 'mailto:info@mrmart.co.in';

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Themes.Primary3,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Icon(FlutterIcons.whatsapp_faw, color: Colors.white),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      "7406234567",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Themes.Text_Color,
                          ),
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Themes.Primary,
                    ),
                    onTap: () async {
                      final url = 'whatsapp://send?phone=917406234567';

                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ],
              ),
            ),
            Text(
              "6:00 AM to 8:00 PM, 365 Days",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Themes.Text_Color,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Please, note that you are accessing the BETA version of www.mrmart.co",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Themes.SUB_TEXT,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Should you encounter any bugs, glitches, lack of functionality, delayed deliveries, billing errors or other problems on the BETA version of the website, please email us on info@mrmart.co.in",
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Themes.SUB_TEXT,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
