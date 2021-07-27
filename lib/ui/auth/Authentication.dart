import 'dart:ui';
import 'dart:io';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Widgets/ShowMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Packege/Loading_Button/Loading_Button.dart';
import 'package:mr_mart/Providers/AuthenticationProvider.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/Widgets/BackButton.dart';
import 'package:mr_mart/Widgets/DefaultTextField.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';

import '../../main.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication>
    with TickerProviderStateMixin {
  AuthenticationProvider provider;
  final UserController userController = Get.find();
  bool imageSourceIsCamera;
  bool _isHidden = true;
  File image;
  final ImagePicker picker = ImagePicker();

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticationProvider>(
      create: (_) => AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            body: mainView(),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return SafeArea(
      child: Container(
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
                          provider.pageIndex == 0
                              ? language.signInyourAccount
                              : language.createYourAccount,
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
                            provider.pageIndex == 0
                                ? language.signIn
                                : language.enterPhoneNumberMessage,
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
            Positioned.fill(
              child: PageView(
                controller: provider.controller,
                children: [
                  signInView(),
                  signUpView(),
                ],
                onPageChanged: provider.onPageChange,
              ),
            ),
            provider.pageIndex != 0
                ? Container()
                : Positioned(
                    bottom: Dimension.size10,
                    width: Get.width,
                    child: bottomView(),
                  ),
            provider.pageIndex != 0
                ? defaultBackButton(context, onTap: provider.back)
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget signUpView() {
    return ListView(
      padding: EdgeInsets.zero,
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
            padding: EdgeInsets.all(Dimension.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: image != null
                      ? FileImage(image)
                      : AssetImage('assets/images/profile/user.jpg'),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 36.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: Themes.buttonColor2,
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(
                          Icons.add_a_photo,
                          size: 20.0,
                          color: Colors.white,
                        ),
                        onPressed: () => chooseImage(),
                      ),
                    ),
                  ),
                ),
                defaultTextField(
                  controller: provider.name,
                  label: language.name,
                  isRequired: true,
                ),
                defaultTextField(
                  controller: provider.email,
                  label: 'Email',
                  isRequired: true,
                ),
                defaultTextField(
                  controller: provider.mobile,
                  label: language.mobile,
                  isRequired: true,
                ),
                defaultTextField(
                  controller: provider.password,
                  label: language.password,
                  isRequired: true,
                  obscureText: _isHidden,
                  suffixIcon: IconButton(
                    icon: _isHidden
                        ? Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                    onPressed: _togglePasswordView,
                  ),
                ),
                defaultTextField(
                  controller: provider.conPassword,
                  label: language.confirmPassword,
                  isRequired: true,
                  obscureText: _isHidden,
                  suffixIcon: IconButton(
                    icon: _isHidden
                        ? Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                    onPressed: _togglePasswordView,
                  ),
                ),
                defaultTextField(
                  controller: provider.address,
                  label: language.address,
                  isRequired: true,
                ),
                defaultTextField(
                  controller: provider.city,
                  label: language.city,
                  isRequired: true,
                ),
                defaultTextField(
                  controller: provider.state,
                  label: language.state,
                  isRequired: true,
                ),
                defaultTextField(
                  controller: provider.pinCode,
                  label: language.pinCode,
                  isRequired: true,
                ),
                SizedBox(
                  height: Dimension.size40,
                ),
                bottomView(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget signInView() {
    return ListView(
      padding: EdgeInsets.zero,
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
            padding: EdgeInsets.all(Dimension.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                defaultTextField(
                  controller: provider.mobile,
                  label: language.mobile,
                  textInputType: TextInputType.phone,
                  isRequired: true,
                ),
                defaultTextField(
                  controller: provider.password,
                  label: language.password,
                  isRequired: true,
                  obscureText: _isHidden,
                  suffixIcon: IconButton(
                    icon: _isHidden
                        ? Icon(
                            Icons.visibility,
                            color: Colors.black54,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.black,
                          ),
                    onPressed: _togglePasswordView,
                  ),
                ),
                SizedBox(
                  height: Dimension.size10,
                )
              ],
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.toNamed(FORGOT_PASSWORD);
          },
          child: Text(
            language.forgotPassword,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Themes.grey,
                ),
          ),
        ),
      ],
    );
  }

  Widget bottomView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingButton(
              isLoading: false,
              onPressed: () {
                provider.pageIndex == 0
                    ? signIn(provider.mobile.text, provider.password.text)
                    : signUp();
              },
              child: Container(
                width: Get.width - (Dimension.padding * 6),
                alignment: Alignment.center,
                padding: EdgeInsets.all(Dimension.size20)
                    .copyWith(top: 0, bottom: 0),
                child: Text(
                  provider.pageIndex == 0 ? language.signIn : language.signUp,
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Themes.white,
                        fontSize: Dimension.size20,
                      ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Dimension.size10,
        ),
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText1,
            text:
                '${provider.pageIndex == 0 ? language.dontHaveAnAccount : language.alreadyHaveAndAccount} ',
            children: <TextSpan>[
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    resetData();
                    provider.changePage();
                  },
                text:
                    provider.pageIndex == 0 ? language.signUp : language.signIn,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: Dimension.textBold,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimension.size10,
        ),
      ],
    );
  }

  AlertDialog chooseImageSource() {
    return AlertDialog(
      actions: [
        Container(
          width: double.maxFinite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton(
                child: Text(
                  'CLOSE',
                  style: TextStyle(color: Colors.grey[500]),
                ),
                onPressed: () {
                  setState(() => imageSourceIsCamera = null);
                  Navigator.of(context).pop();
                },
              ),
              Row(
                children: [
                  TextButton(
                    child: Text('Camera'),
                    onPressed: () {
                      setState(() => imageSourceIsCamera = true);
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Gallery'),
                    onPressed: () {
                      setState(() => imageSourceIsCamera = false);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ),
        )
      ],
      title: Text('Upload Image'),
      content: Text('Select the source for image.'),
    );
  }

  Future<void> chooseImage() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) => chooseImageSource(),
    );
    if (imageSourceIsCamera != null) {
      final pickedFile = await picker.pickImage(
        source: imageSourceIsCamera ? ImageSource.camera : ImageSource.gallery,
        preferredCameraDevice: CameraDevice.front,
      );
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        infoMessage(context, message: 'No image selected');
      }
      setState(() {});
    }
  }

  void signIn(String mobile, String password) async {
    if (GetUtils.isBlank(mobile)) {
      errorMessage(context, message: "Mobile number is required");
      return;
    } else if (mobile.length != 10 || !GetUtils.isNumericOnly(mobile)) {
      errorMessage(context, message: "Invalid mobile number");
      return;
    } else if (GetUtils.isBlank(password)) {
      errorMessage(context, message: "Password is required");
      return;
    }
    var fetchStatus = await userController.fetchUser(mobile, password);

    if (!fetchStatus) {
      errorMessage(context, message: "Mobile number or Password incorrect");
      return;
    }
    Get.offNamed(GET_USER_LOCATION_SCREEN);
  }

  void signUp() async {
    if (GetUtils.isNullOrBlank(provider.name.text)) {
      errorMessage(context, message: "Name is required");
      return;
    }
    if (!GetUtils.removeAllWhitespace(provider.name.text).isAlphabetOnly) {
      errorMessage(context, message: "Invalid name");
      return;
    }
    if (!GetUtils.isEmail(provider.email.text)) {
      errorMessage(context, message: "Invalid Email");
      return;
    }
    if (GetUtils.isNullOrBlank(provider.mobile.text)) {
      errorMessage(context, message: "Mobile number is required");
      return;
    }
    if (provider.mobile.text.length != 10 ||
        !GetUtils.isNumericOnly(provider.mobile.text)) {
      errorMessage(context, message: "Invalid mobile number");
      return;
    }
    if (GetUtils.isNullOrBlank(provider.password.text)) {
      errorMessage(context, message: "Password is required");
      return;
    }
    if (GetUtils.isLengthLessOrEqual(provider.password.text, 5)) {
      errorMessage(context, message: "Must be atleast 6 characters long.");
      return;
    }
    if (GetUtils.isNullOrBlank(provider.conPassword.text)) {
      errorMessage(context, message: "Confirm password is required");
      return;
    }
    if (provider.password.text != provider.conPassword.text) {
      errorMessage(context, message: "Passwords doesn't match");
      return;
    }
    if (GetUtils.isNullOrBlank(provider.address.text)) {
      errorMessage(context, message: "Address is required");
      return;
    }
    if (GetUtils.isLengthLessOrEqual(provider.address.text, 4)) {
      errorMessage(context, message: "Invalid Address");
      return;
    }
    if (GetUtils.isNullOrBlank(provider.city.text)) {
      errorMessage(context, message: "City is required");
      return;
    }
    if (!GetUtils.removeAllWhitespace(provider.city.text).isAlphabetOnly) {
      errorMessage(context, message: "Invalid city value");
      return;
    }
    if (GetUtils.isNullOrBlank(provider.state.text)) {
      errorMessage(context, message: "State is required");
      return;
    }
    if (!GetUtils.removeAllWhitespace(provider.state.text).isAlphabetOnly) {
      errorMessage(context, message: "Invalid state value");
      return;
    }
    if (GetUtils.isNullOrBlank(provider.pinCode.text)) {
      errorMessage(context, message: "Pincode is required");
      return;
    }
    if (!(GetUtils.isLengthEqualTo(provider.pinCode.text.trim(), 6) ||
        GetUtils.isNumericOnly(provider.pinCode.text))) {
      errorMessage(context, message: "Invalid pincode");
      return;
    }

    var profileImage = image;

    var response = await userController.createUser(
      profileImage,
      provider.name.text,
      provider.email.text,
      provider.mobile.text,
      provider.password.text,
      provider.address.text,
      provider.city.text,
      provider.state.text,
      provider.pinCode.text,
    );
    if (!response['status']) {
      errorMessage(context, message: response['message']);
      return;
    }

    resetData();
    provider.changePage();
    successMessage(context,
        message: "Sign up successful. Please, Login to continue.");
  }

  void resetData() {
    image = null;
    imageSourceIsCamera = null;
    provider.name.text = "";
    provider.email.text = "";
    provider.mobile.text = "";
    provider.password.text = "";
    provider.conPassword.text = "";
    provider.address.text = "";
    provider.city.text = "";
    provider.state.text = "";
    provider.pinCode.text = "";
  }
}
