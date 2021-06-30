import 'package:MrMart/Controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/ui/profile/components/list.dart' as list_data;
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
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
                    userController.user.value.profileImage.length > 0
                        ? NetworkImage(AppConstant.MediaUrl +
                            userController.user.value.profileImage)
                        : AssetImage('assets/images/profile/user.jpg'),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                userController.user.value.name ?? "User",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConstant.font_mukta),
              ),
              Text(
                userController.user.value.mobile ?? "0000000000",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppConstant.font_mukta),
              ),
              SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
      //body: Body(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: list_data.getListView(),
      ),
    );
  }
}
