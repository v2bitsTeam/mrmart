import 'dart:ui';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Widgets/ShowMessage.dart';
import 'package:mr_mart/ui_components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Providers/ForgotPasswordProvider.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/Widgets/BackButton.dart';
import 'package:mr_mart/Widgets/DefaultTextField.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>
    with TickerProviderStateMixin {
  ForgotPasswordProvider provider;
  TextEditingController mobileController;
  final UserController userController = Get.find();

  @override
  void initState() {
    mobileController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgotPasswordProvider>(
      create: (_) => ForgotPasswordProvider(),
      child: Consumer<ForgotPasswordProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            body: WillPopScope(onWillPop: provider.back, child: mainView()),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            height: Get.height * 0.3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Themes.primary2,
                        ),
                      ),
                      Image.asset(
                        'assets/images/header.png',
                        width: Get.width,
                        fit: BoxFit.fitWidth,
                        color: Themes.primary2,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: paddingTop,
                  width: Get.width,
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimension.size5,
                      ),
                      Text(
                        language.forgotPasswordTitle[provider.pageIndex],
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              color: Themes.white,
                              fontSize: Dimension.size20,
                              fontWeight: Dimension.textMedium,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: Dimension.size32,
                          right: Dimension.size32,
                          top: Dimension.size20,
                          bottom: Dimension.size20,
                        ),
                        child: Text(
                          "Have you forgot your account password? Don't worry, we are here to help.",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Themes.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          showContent(),
          defaultBackButton(context, onTap: Get.back)
        ],
      ),
    );
  }

  void sendEmail() async {
    if (GetUtils.isBlank(mobileController.text)) {
      errorMessage(context, message: "Mobile number is required");
      return;
    } else if (mobileController.text.length != 10 ||
        !GetUtils.isNumericOnly(mobileController.text)) {
      errorMessage(context, message: "Invalid mobile number");
      return;
    }
    mobileController.text = "";
    var response =
        await userController.sendEmailForForgotPassword(mobileController.text);

    if (response['status']) {
      successMessage(context,
          message: "Mail sent. Please, check your registered email.");
      return;
    }
    errorMessage(context, message: response['message']);
  }

  Widget showContent() {
    return Container(
      width: Get.width * 0.90,
      height: Get.height * 0.40,
      margin: EdgeInsets.only(top: Get.height * 0.30, left: Get.width * 0.05),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Enter your mobile number and we would send an email with further instrutions to your registered email address if the account exists.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Themes.subText,
                  fontSize: Dimension.size18,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: defaultTextField(
              controller: mobileController,
              label: "Mobile No.",
              isRequired: true,
            ),
          ),
          DefaultButton(
            text: "Send Email",
            press: sendEmail,
          ),
        ],
      ),
    );
  }

  Widget enterMobileView() {
    return ListView(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      children: [
        Card(
          margin: EdgeInsets.only(
            top: (Get.height * 0.2),
            left: Dimension.padding,
            right: Dimension.padding,
            bottom: Dimension.size20,
          ),
          elevation: Dimension.cardElevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: Get.height * 0.15,
            alignment: Alignment.center,
            padding: EdgeInsets.all(Dimension.padding),
            child: defaultTextField(
              controller: provider.mobile,
              label: language.mobile,
              textInputType: TextInputType.number,
            ),
          ),
        ),
      ],
    );
  }

  Widget enterNewPasswordView() {
    return ListView(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      children: [
        Card(
          margin: EdgeInsets.only(
            top: (Get.height * 0.2),
            left: Dimension.padding,
            right: Dimension.padding,
            bottom: Dimension.size20,
          ),
          elevation: Dimension.cardElevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(Dimension.padding),
            child: Column(
              children: [
                defaultTextField(
                  controller: provider.newPass,
                  label: language.newPassword,
                ),
                defaultTextField(
                  controller: provider.newConPass,
                  label: language.confirmNewpassword,
                ),
                SizedBox(
                  height: Dimension.size10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget verifyPinView() {
    return ListView(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      children: [
        Card(
          margin: EdgeInsets.only(
            top: (Get.height * 0.2),
            left: Dimension.padding,
            right: Dimension.padding,
            bottom: Dimension.size10,
          ),
          elevation: Dimension.cardElevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: Get.height * 0.15,
            alignment: Alignment.center,
            child: Container(
              height: Get.height * 0.05,
              margin: EdgeInsets.only(
                left: Dimension.padding,
                right: Dimension.padding,
              ),
              child: PinPut(
                fieldsCount: 4,
                onSubmit: (String pin) {},
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration.copyWith(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Themes.primary.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1, color: Themes.primary),
      ),
    );
  }
}
