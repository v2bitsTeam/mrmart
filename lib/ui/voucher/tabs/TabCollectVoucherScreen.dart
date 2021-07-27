import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mr_mart/ui_components/default_collect_voucher_button.dart';

class TabCollectVoucherScreen extends StatelessWidget {
  TabCollectVoucherScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        shrinkWrap: true,
        children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/voucher/voucher1.png',
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "\$50.00",
                      style: TextStyle(
                        fontSize: kVoucherLeftText,
                        color: Colors.white,
                        fontFamily: AppConstant.fontOswald,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "VOUCHER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppConstant.fontOswald,
                              fontWeight: FontWeight.bold,
                              fontSize: kVoucherMiddleText,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BorderedText(
                            strokeWidth: 1.5,
                            strokeColor: Colors.white,
                            child: Text(
                              '10%',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationColor: Colors.white,
                                fontFamily: AppConstant.fontOswald,
                                fontSize: kVoucherMiddleNumText,
                                color: Colors.transparent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            ' off',
                            style: TextStyle(
                              fontFamily: AppConstant.fontOswald,
                              fontSize: kVoucherMiddleSubText,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: SvgPicture.asset(
                                'assets/icons/voucher/voucher_box10.svg'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(kVoucherRightBoxPadding),
                            child: DefaultCollectVoucherButton(
                              text: "Collect",
                              press: () {
                                Get.toNamed(VOUCHER_SCREEN);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/voucher/voucher2.png',
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "\$150.00",
                      style: TextStyle(
                        fontSize: kVoucherLeftText,
                        color: Colors.white,
                        fontFamily: AppConstant.fontOswald,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "VOUCHER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppConstant.fontOswald,
                              fontWeight: FontWeight.bold,
                              fontSize: kVoucherMiddleText,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BorderedText(
                            strokeWidth: 1.5,
                            strokeColor: Colors.white,
                            child: Text(
                              '25%',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationColor: Colors.white,
                                fontFamily: AppConstant.fontOswald,
                                fontSize: kVoucherMiddleNumText,
                                color: Colors.transparent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            ' off',
                            style: TextStyle(
                              fontFamily: AppConstant.fontOswald,
                              fontSize: kVoucherMiddleSubText,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: SvgPicture.asset(
                                'assets/icons/voucher/voucher_box25.svg'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(kVoucherRightBoxPadding),
                            child: DefaultCollectVoucherButton(
                              text: "Collect",
                              press: () {
                                Get.toNamed(VOUCHER_SCREEN);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                //I assumed you want to occupy the entire space of the card
                image: AssetImage(
                  'assets/images/voucher/voucher3.png',
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "\$200.00",
                      style: TextStyle(
                        fontSize: kVoucherLeftText,
                        color: Colors.white,
                        fontFamily: AppConstant.fontOswald,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "VOUCHER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppConstant.fontOswald,
                              fontWeight: FontWeight.bold,
                              fontSize: kVoucherMiddleText,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BorderedText(
                            strokeWidth: 1.5,
                            strokeColor: Colors.white,
                            child: Text(
                              '50%',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationColor: Colors.white,
                                fontFamily: AppConstant.fontOswald,
                                fontSize: kVoucherMiddleNumText,
                                color: Colors.transparent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            ' off',
                            style: TextStyle(
                              fontFamily: AppConstant.fontOswald,
                              fontSize: kVoucherMiddleSubText,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: SvgPicture.asset(
                                'assets/icons/voucher/voucher_box50.svg'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(kVoucherRightBoxPadding),
                            child: DefaultCollectVoucherButton(
                              text: "Collect",
                              press: () {
                                Get.toNamed(VOUCHER_SCREEN);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/voucher/voucher4.png',
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "\$200.00",
                      style: TextStyle(
                        fontSize: kVoucherLeftText,
                        color: Colors.white,
                        fontFamily: AppConstant.fontOswald,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "VOUCHER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: AppConstant.fontOswald,
                              fontWeight: FontWeight.bold,
                              fontSize: kVoucherMiddleText,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BorderedText(
                            strokeWidth: 1.5,
                            strokeColor: Colors.white,
                            child: Text(
                              '50%',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationColor: Colors.white,
                                fontFamily: AppConstant.fontOswald,
                                fontSize: kVoucherMiddleNumText,
                                color: Colors.transparent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            ' off',
                            style: TextStyle(
                              fontFamily: AppConstant.fontOswald,
                              fontSize: kVoucherMiddleSubText,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            child: SvgPicture.asset(
                                'assets/icons/voucher/voucher_box50_1.svg'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(kVoucherRightBoxPadding),
                            child: DefaultCollectVoucherButton(
                              text: "Collect",
                              press: () {
                                Get.toNamed(VOUCHER_SCREEN);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
