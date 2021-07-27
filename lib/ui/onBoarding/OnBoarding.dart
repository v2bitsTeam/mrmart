import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Packege/Loading_Button/Loading_Button.dart';
import 'package:mr_mart/Providers/OnBoardingProvider.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

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
            backgroundColor: Themes.primaryLite,
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
      children: language.onboardingTitle
          .asMap()
          .map(
            (index, value) => MapEntry(
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
                          top: Dimension.padding,
                          bottom: Dimension.padding,
                          left: Dimension.size10,
                          right: Dimension.size10,
                        ),
                        decoration: BoxDecoration(
                          color: provider.itemColor[provider.currentIndex],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimension.size10),
                            topRight: Radius.circular(Dimension.size10),
                          ),
                        ),
                        child: Container(
                          child: Column(
                            children: [
                              Text(
                                language.onboardingTitle[provider.currentIndex],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(fontSize: Dimension.size30),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                language
                                    .onboardingMessage[provider.currentIndex],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      color: Themes.textColor.withOpacity(0.8),
                                      fontSize: Dimension.size16,
                                    ),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SmoothPageIndicator(
                                      controller: provider.controller,
                                      count: language.onboardingTitle.length,
                                      effect: ExpandingDotsEffect(
                                        expansionFactor: 4,
                                        dotHeight: Dimension.size10,
                                        dotColor: Themes.white,
                                        activeDotColor: Themes.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Dimension.size20,
                                    ),
                                    LoadingButton(
                                      isLoading: false,
                                      onPressed: () =>
                                          Get.toNamed(LOCATION_PERMISSION),
                                      child: Container(
                                          width: Get.width * 0.45,
                                          alignment: Alignment.center,
                                          padding:
                                              EdgeInsets.all(Dimension.size20)
                                                  .copyWith(top: 0, bottom: 0),
                                          child: Text(
                                            provider.currentIndex ==
                                                    language.onboardingTitle
                                                            .length -
                                                        1
                                                ? language.getStarted
                                                : language.skip,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                  color: Themes.white,
                                                  fontSize: Dimension.size20,
                                                ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: Dimension.size10,
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
            ),
          )
          .values
          .toList(),
    );
  }
}
