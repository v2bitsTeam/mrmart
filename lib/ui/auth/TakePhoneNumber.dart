import 'dart:async';
import 'dart:ui';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:MrMart/Packege/Loading_Button/Loading_Button.dart';
import 'package:MrMart/Providers/LocationPermissionProvider.dart';
import 'package:MrMart/Providers/SplashProvider.dart';
import 'package:MrMart/Providers/TakePhoneNumberProvider.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/Widgets/BackButton.dart';
import 'package:MrMart/Widgets/CustomAppbar.dart';
import 'package:MrMart/Widgets/DefaultAppbar.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'package:provider/provider.dart';

import '../../main.dart';
import '../BaseActivity.dart';

class TakePhoneNumber extends StatefulWidget {
  @override
  _TakePhoneNumberState createState() => _TakePhoneNumberState();
}

class _TakePhoneNumberState extends State<TakePhoneNumber>
    with TickerProviderStateMixin {
  TakePhoneNumberProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TakePhoneNumberProvider>(
      create: (_) => TakePhoneNumberProvider(),
      child: Consumer<TakePhoneNumberProvider>(
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
                        color: Themes.Primary,
                      )),
                      Image.asset(
                        'assets/images/header.png',
                        width: Get.width,
                        fit: BoxFit.fitWidth,
                        color: Themes.Primary,
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
                          provider.pageIndex == 0
                              ? language.Enter_your_phoneNimber
                              : language.Phone_Verifation,
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
                            language.Enter_Phone_number_message,
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
          Positioned.fill(
            child: PageView(
              controller: provider.controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                PhoneNumberView(),
                PinCodeView(),
              ],
              onPageChanged: provider.onPageChange,
            ),
          ),
          Positioned(
            bottom: Dimension.Size_20,
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingButton(
                  isLoading: false,
                  onPressed: () {
                    provider.changePage();
                  },
                  child: Container(
                      width: Get.width - (Dimension.Padding * 6),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(Dimension.Size_20)
                          .copyWith(top: 0, bottom: 0),
                      child: Text(
                        language.Continue,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Themes.White, fontSize: Dimension.Size_20),
                      )),
                ),
              ],
            ),
          ),
          DefaultBackButton(context, onTap: provider.back)
        ],
      ),
    );
  }

  Widget PhoneNumberView() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Card(
          margin: EdgeInsets.only(
              top: (Get.height * 0.20),
              left: Dimension.Padding,
              right: Dimension.Padding,
              bottom: Dimension.Size_20),
          elevation: Dimension.card_elevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: Get.height * 0.15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimension.Padding),
                  height: Get.height * 0.09,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CountryPickerDropdown(
                            initialValue: AppConstant.Default_Country,
                            itemBuilder: buildDropdownItem,
                            sortComparator: (Country a, Country b) =>
                                a.isoCode.compareTo(b.isoCode),
                            onValuePicked: (Country country) =>
                                provider.setCountryCode(country),
                          ),
                          Text(
                            provider.countryCode,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Container(
                        height: 1,
                        width: Get.width * 0.22,
                        color: Themes.Text_Color,
                        margin: EdgeInsets.only(bottom: Dimension.Size_10),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimension.Padding, right: Dimension.Padding),
                    height: Get.height * 0.09,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                              hintText: language.Enter_your_phoneNimber,
                              helperStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Themes.Grey_lite)),
                        ),
                        Container(
                          height: 1,
                          color: Themes.Text_Color,
                          margin: EdgeInsets.only(bottom: Dimension.Size_10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownItem(Country country) => Container(
        child: CountryPickerUtils.getDefaultFlagImage(country),
      );

  Widget PinCodeView() {
    return ListView(
      padding: EdgeInsets.zero,
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
        ),
        FlatButton(
            onPressed: () {},
            child: Text(
              language.Resend_Code,
              style: Theme.of(context).textTheme.bodyText1,
            )),
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
