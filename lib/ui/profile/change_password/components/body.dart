import 'dart:async';

import 'package:MrMart/Controllers/user_controller.dart';
import 'package:MrMart/Services/http_services.dart';
import 'package:MrMart/Widgets/DefaultTextField.dart';
import 'package:MrMart/Widgets/ShowMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:get/get.dart';
import 'package:MrMart/ui_components/DefaultTextFieldProfileEdit.dart';
import 'package:MrMart/ui_components/default_button.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isExpanded = false;
  TextEditingController newPasswordController;
  TextEditingController oldPasswordController;
  TextEditingController confirmPasswordController;
  bool obscureNewPassword = true;
  bool obscureOldPassword = true;
  final UserController userController = Get.find();

  @override
  void initState() {
    super.initState();
    newPasswordController = TextEditingController();
    oldPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Change Password',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              height: 1,
            ),
          ),
          //TitleWithClearAllBtn(text: "Today", press: () {}),
          SizedBox(
            height: 15,
          ),
          changePasswordView(),
        ],
      ),
    );
  }

  Widget changePasswordView() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      children: [
        Card(
          /*margin: EdgeInsets.only(
            top: (Get.height * 0.2),
            left: Dimension.Padding,
            right: Dimension.Padding,
            bottom: Dimension.Size_20),*/
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            padding: EdgeInsets.all(Dimension.Padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DefaultTextFieldProfileEdit(
                  controller: oldPasswordController,
                  label: 'Old Password',
                  isRequired: true,
                  obscureText: obscureOldPassword,
                  suffixIcon: IconButton(
                    icon: obscureOldPassword
                        ? Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                    onPressed: () {
                      setState(() {
                        obscureOldPassword = !obscureOldPassword;
                      });
                    },
                  ),
                ),
                DefaultTextFieldProfileEdit(
                  controller: newPasswordController,
                  label: 'New Password',
                  isRequired: true,
                  obscureText: obscureNewPassword,
                  suffixIcon: IconButton(
                    icon: obscureNewPassword
                        ? Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                    onPressed: () {
                      setState(() {
                        obscureNewPassword = !obscureNewPassword;
                      });
                    },
                  ),
                ),
                DefaultTextFieldProfileEdit(
                  controller: confirmPasswordController,
                  label: 'Confirm Password',
                  isRequired: true,
                  obscureText: obscureNewPassword,
                  suffixIcon: IconButton(
                    icon: obscureNewPassword
                        ? Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                    onPressed: () {
                      setState(() {
                        obscureNewPassword = !obscureNewPassword;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: Dimension.Size_10,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: DefaultButton(
            text: "Save Changes",
            press: updateUserPassword,
          ),
        ),
      ],
    );
  }

  updateUserPassword() async {
    if (GetUtils.isNullOrBlank(newPasswordController.text)) {
      errorMessage(context, message: "New Password is required");
      return;
    }
    if (GetUtils.isNullOrBlank(oldPasswordController.text)) {
      errorMessage(context, message: "Old Password is required");
      return;
    }
    if (GetUtils.isNullOrBlank(confirmPasswordController.text)) {
      errorMessage(context, message: "Confirm Password is required");
      return;
    }
    if (confirmPasswordController.text != newPasswordController.text) {
      errorMessage(context, message: "Passwords doesn't match");
      return;
    }
    if (oldPasswordController.text == newPasswordController.text) {
      infoMessage(context, message: "Nothing to change");
      return;
    }
    var response = await userController.changeUserPassword(
        newPasswordController.text,
        oldPasswordController.text,
        userController.user.value.uid);

    if (!response) {
      errorMessage(context,
          message: "Something went wrong. Please, try again.");
      return;
    }

    successMessage(context, message: "Password updated successfully.");
    Timer(Duration(seconds: 2), () => Get.offNamed(PROFILE_SCREEN));
  }
}
