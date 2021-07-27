import 'dart:ui';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/Packege/Loading_Button/Loading_Button.dart';
import 'package:mr_mart/Providers/TakePhoneNumberProvider.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Widgets/BackButton.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class TakePhoneNumber extends StatefulWidget {
  @override
  _TakePhoneNumberState createState() => _TakePhoneNumberState();
}

class _TakePhoneNumberState extends State<TakePhoneNumber>
    with TickerProviderStateMixin {
  TakePhoneNumberProvider provider;

  @override
  void initState() {
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
                        color: Themes.primary,
                      )),
                      Image.asset(
                        'assets/images/header.png',
                        width: Get.width,
                        fit: BoxFit.fitWidth,
                        color: Themes.primary,
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
                              ? language.enterYourPhoneNimber
                              : language.phoneVerifation,
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
                            language.enterPhoneNumberMessage,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Themes.white),
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
                phoneNumberView(),
                pinCodeView(),
              ],
              onPageChanged: provider.onPageChange,
            ),
          ),
          Positioned(
            bottom: Dimension.size20,
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
                    width: Get.width - (Dimension.padding * 6),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(Dimension.size20)
                        .copyWith(top: 0, bottom: 0),
                    child: Text(
                      language.continueWord,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Themes.white,
                            fontSize: Dimension.size20,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          defaultBackButton(context, onTap: provider.back)
        ],
      ),
    );
  }

  Widget phoneNumberView() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Card(
          margin: EdgeInsets.only(
            top: (Get.height * 0.20),
            left: Dimension.padding,
            right: Dimension.padding,
            bottom: Dimension.size20,
          ),
          elevation: Dimension.cardElevation,
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: Get.height * 0.15,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimension.padding),
                  height: Get.height * 0.09,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CountryPickerDropdown(
                            initialValue: AppConstant.defaultCountry,
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
                        color: Themes.textColor,
                        margin: EdgeInsets.only(bottom: Dimension.size10),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: Dimension.padding, right: Dimension.padding),
                    height: Get.height * 0.09,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                            hintText: language.enterYourPhoneNimber,
                            helperStyle: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Themes.greyLite),
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Themes.textColor,
                          margin: EdgeInsets.only(bottom: Dimension.size10),
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

  Widget pinCodeView() {
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
        TextButton(
            onPressed: () {},
            child: Text(
              language.resendCode,
              style: Theme.of(context).textTheme.bodyText1,
            )),
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
