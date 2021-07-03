import 'dart:ui';
import 'package:MrMart/Controllers/user_controller.dart';
import 'package:MrMart/Widgets/ShowMessage.dart';
import 'package:MrMart/ui_components/default_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/Providers/ForgotPasswordProvider.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/Widgets/BackButton.dart';
import 'package:MrMart/Widgets/DefaultTextField.dart';
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
                        color: Themes.Primary2,
                      )),
                      Image.asset(
                        'assets/images/header.png',
                        width: Get.width,
                        fit: BoxFit.fitWidth,
                        color: Themes.Primary2,
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
                          height: Dimension.Size_5,
                        ),
                        Text(
                          language.Forgot_Password_Title[provider.pageIndex],
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              color: Themes.White,
                              fontSize: Dimension.Size_20,
                              fontWeight: Dimension.textMedium),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: Dimension.Size_32,
                              right: Dimension.Size_32,
                              top: Dimension.Size_20,
                              bottom: Dimension.Size_20),
                          child: Text(
                            "Have you forgot your account password? Don't worry, we are here to help.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Themes.White),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          showContent(),

          // Positioned(

          //   top: Get.height * 0.25,
          //   child:
          //   // child: PageView(
          //   //   controller: provider.controller,
          //   //   // physics: NeverScrollableScrollPhysics(),
          //   //   children: [
          //   //     enterMobileView(),
          //   //     verifyPinView(),
          //   //     enterNewPasswordView()
          //   //   ],
          //   //   onPageChanged: provider.onPageChange,
          //   // ),
          // ),
          // Positioned(
          //   bottom: Dimension.Size_20,
          //   width: Get.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       LoadingButton(
          //         isLoading: false,
          //         onPressed: () {
          //           provider.changePage();
          //         },
          //         child: Container(
          //             width: Get.width - (Dimension.Padding * 6),
          //             alignment: Alignment.center,
          //             padding: EdgeInsets.all(Dimension.Size_20)
          //                 .copyWith(top: 0, bottom: 0),
          //             child: Text(
          //               language.Forgot_Password_Button[provider.pageIndex],
          //               style: Theme.of(context).textTheme.bodyText1.copyWith(
          //                   color: Themes.White, fontSize: Dimension.Size_20),
          //             )),
          //       ),
          //     ],
          //   ),
          // ),
          DefaultBackButton(context, onTap: Get.back)
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
                  color: Themes.SUB_TEXT,
                  fontSize: Dimension.Size_18,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DefaultTextField(
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

      // Text(
      //   "Please, contact us at info@mrmart.co.in and we would help you out.",
      //   textAlign: TextAlign.center,
      //   style: Theme.of(context).textTheme.bodyText1.copyWith(
      //         color: Themes.Text_Color,
      //         fontSize: Dimension.Size_20,
      //       ),
      // ),
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
              left: Dimension.Padding,
              right: Dimension.Padding,
              bottom: Dimension.Size_20),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: Get.height * 0.15,
            alignment: Alignment.center,
            padding: EdgeInsets.all(Dimension.Padding),
            child: DefaultTextField(
              controller: provider.mobile,
              label: language.Mobile,
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
              left: Dimension.Padding,
              right: Dimension.Padding,
              bottom: Dimension.Size_20),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(Dimension.Padding),
            child: Column(
              children: [
                DefaultTextField(
                    controller: provider.newPass, label: language.New_password),
                DefaultTextField(
                    controller: provider.newConPass,
                    label: language.Confirm_New_password),
                SizedBox(
                  height: Dimension.Size_10,
                )
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
              left: Dimension.Padding,
              right: Dimension.Padding,
              bottom: Dimension.Size_10),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: Get.height * 0.15,
            alignment: Alignment.center,
            child: Container(
              height: Get.height * 0.05,
              margin: EdgeInsets.only(
                  left: Dimension.Padding, right: Dimension.Padding),
              child: PinPut(
                fieldsCount: 4,
                onSubmit: (String pin) {},
                //focusNode: _pinPutFocusNode,
                //controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration.copyWith(
                  border: Border(
                    bottom: BorderSide(
                        width: 1, color: Themes.Primary.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  BoxDecoration get pinPutDecoration {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1, color: Themes.Primary),
      ),
    );
  }
}
