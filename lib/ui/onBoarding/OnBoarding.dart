import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/Packege/Loading_Button/Loading_Button.dart';
import 'package:MrMart/Providers/OnBoardingProvider.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../main.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  OnBoardingProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnBoardingProvider>(
      create: (_) => OnBoardingProvider(),
      child: Consumer<OnBoardingProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            backgroundColor: Themes.Primary_Lite,
            body: mainView(),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return PageView(
      controller: provider.controller,
      onPageChanged: (index) {
        provider.setCurrentIndex(index);
      },
      children: language.OnboardingTitle.asMap()
          .map((index, value) => MapEntry(
                index,
                Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          'assets/images/onboard$index.svg',
                          height: Get.height * 0.6,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        child: Container(
                          height: Get.height * 0.45,
                          width: Get.width,
                          padding: EdgeInsets.only(
                              top: Dimension.Padding,
                              bottom: Dimension.Padding,
                              left: Dimension.Size_10,
                              right: Dimension.Size_10),
                          decoration: BoxDecoration(
                              color: provider.itemColor[provider.currentIndex],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Dimension.Size_10),
                                  topRight:
                                      Radius.circular(Dimension.Size_10))),
                          child: Container(
                            child: Column(
                              children: [
                                Text(
                                    language
                                        .OnboardingTitle[provider.currentIndex],
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(fontSize: Dimension.Size_30),
                                    textAlign: TextAlign.center),
                                Text(
                                  language
                                      .OnboardingMessage[provider.currentIndex],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                          color: Themes.Text_Color.withOpacity(
                                              0.8),
                                          fontSize: Dimension.Size_16),
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SmoothPageIndicator(
                                          controller: provider.controller,
                                          count:
                                              language.OnboardingTitle.length,
                                          effect: ExpandingDotsEffect(
                                              expansionFactor: 4,
                                              dotHeight: Dimension.Size_10,
                                              dotColor: Themes.White,
                                              activeDotColor: Themes.White)),
                                      SizedBox(
                                        height: Dimension.Size_20,
                                      ),
                                      LoadingButton(
                                        isLoading: false,
                                        onPressed: () {
                                          Get.toNamed(LOCATION_PERMISSION);
                                          //Get.toNamed(MAIN_PAGE);
                                          //Get.toNamed(CHECKOUT_SCREEN);
                                          //Get.toNamed(TAKE_PHONE_NUMBER);
                                          //Get.toNamed(LOCATION_PERMISSION);
                                        },
                                        child: Container(
                                            width: Get.width * 0.45,
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.all(
                                                    Dimension.Size_20)
                                                .copyWith(top: 0, bottom: 0),
                                            child: Text(
                                              provider.currentIndex ==
                                                      language.OnboardingTitle
                                                              .length -
                                                          1
                                                  ? language.Get_Started
                                                  : language.Skip,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                      color: Themes.White,
                                                      fontSize:
                                                          Dimension.Size_20),
                                            )),
                                      ),
                                      SizedBox(
                                        height: Dimension.Size_10,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ))
          .values
          .toList(),
    );
  }
}
