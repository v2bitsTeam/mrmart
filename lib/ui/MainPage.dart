import 'dart:ui';
import 'package:MrMart/Controllers/cart_controller.dart';
import 'package:MrMart/Controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/Packege/BottomTab/BottomTab.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:MrMart/Packege/NavigationDrawer/CustomDrawer.dart';
import 'package:MrMart/Providers/MainPageProvider.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:MrMart/ui/category/category_screen.dart';
import 'package:MrMart/ui/search/search_screen.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import 'BaseActivity.dart';
import 'HomePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  MainPageProvider provider;
  final UserController userController = Get.put(UserController());
  final CartController cartController = Get.put(CartController());

  double invisibleHeight = (Get.height * 0.15) * 0.2;

  @override
  void initState() {
    super.initState();
    cartController.fetchCart(userController.user.value.uid);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainPageProvider>(
      create: (_) => MainPageProvider()..setController(this),
      child: Consumer<MainPageProvider>(
        builder: (context, model, child) {
          provider = model;
          return SafeArea(
            child: CustomDrawer(
              body: BaseActivity(
                title: language.Main_Page_Tab[provider.selectedTab],
                automaticLeading: false,
                body: openTabView(),
                bottomNavigationBar: Container(
                  padding: EdgeInsets.all(Dimension.Size_5),
                  decoration: BoxDecoration(
                    color: Themes.White,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimension.Padding2),
                        topLeft: Radius.circular(Dimension.Padding2)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: Dimension.Size_30,
                        offset: Offset(0,
                            Dimension.Padding2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: BottomTab(
                    currentIndex: provider.selectedTab,
                    onTap: provider.handleIndexChanged,
                    items: language.Main_Page_Tab.asMap()
                        .map((index, value) => MapEntry(
                            index,
                            BottomTabItem(
                              icon: SvgPicture.asset(
                                'assets/icons/home-tab$index.svg',
                                color: Themes.Primary,
                                height: Dimension.Size_20,
                              ),
                              title: Text(
                                value,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(color: Themes.Primary),
                              ),
                              selectedColor: Themes.Primary,
                            )))
                        .values
                        .toList(),
                  ),
                ),
              ),
              drawer: BuildDrawerNav(),
            ),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return TabBarView(
      controller: provider.tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomePage(),
        CategoryScreen(),
        SearchScreen(),
      ],
    );
  }

  Widget openTabView() {
    if (provider.selectedTab == 0) {
      return HomePage();
    } else if (provider.selectedTab == 1) {
      return CategoryScreen();
    } else if (provider.selectedTab == 2) {
      return SearchScreen();
    }
  }
}

class BuildDrawerNav extends StatelessWidget {
  final UserController userController = Get.find();

  BuildDrawerNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: kDrawerPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: userController.user.value.profileImage != null &&
                      userController.user.value.profileImage.length > 0
                  ? NetworkImage(AppConstant.MediaUrl +
                      userController.user.value.profileImage)
                  : AssetImage('assets/images/profile/user.jpg'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              userController.user.value.name ?? "User",
              style: TextStyle(
                  fontSize: kDrawerFontSize,
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppConstant.font_mukta),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      Get.toNamed(PROFILE_SCREEN);
                    },
                  ),
                  InkWell(
                    child: Text(
                      'Order History',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      Get.toNamed(ORDER_HISTORY_SCREEN);
                    },
                  ),
                  // InkWell(
                  //   child: Text(
                  //     'Add Location',
                  //     style: TextStyle(
                  //         fontSize: 16,
                  //         height: kDrawerFontSizeHeight,
                  //         color: Colors.white,
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.bold,
                  //         fontFamily: AppConstant.font_mukta),
                  //   ),
                  //   onTap: () {
                  //     //Get.toNamed(LOCATION_PERMISSION);
                  //     Get.toNamed(ADD_LOCATION_SCREEN);
                  //   },
                  // ),

                  // InkWell(
                  //   child: Text(
                  //     'Order Track',
                  //     style: TextStyle(
                  //         fontSize: 16,
                  //         height: kDrawerFontSizeHeight,
                  //         color: Colors.white,
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.bold,
                  //         fontFamily: AppConstant.font_mukta),
                  //   ),
                  //   onTap: () {
                  //     Get.toNamed(ORDER_TRACK_SCREEN);
                  //   },
                  // ),
                  // InkWell(
                  //   child: Text(
                  //     'Settings',
                  //     style: TextStyle(
                  //         fontSize: 16,
                  //         height: kDrawerFontSizeHeight,
                  //         color: Colors.white,
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.bold,
                  //         fontFamily: AppConstant.font_mukta),
                  //   ),
                  //   onTap: () {
                  //     Get.toNamed(SETTINGS_SCREEN);
                  //   },
                  // ),
                  InkWell(
                    child: Text(
                      'About Us',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      Get.toNamed(ABOUT_US_SCREEN);
                    },
                  ),
                  InkWell(
                    child: Text(
                      'Contact Us',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      Get.toNamed(CONTACT_US_SCREEN);
                    },
                  ),
                  InkWell(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      Get.toNamed(PRIVACY_POLICY_SCREEN);
                    },
                  ),
                  InkWell(
                    child: Text(
                      'Shipping Policy',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      Get.toNamed(SHIPPING_POLICY_SCREEN);
                    },
                  ),
                  InkWell(
                    child: Text(
                      'Returns & Refund Policy',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      Get.toNamed(RETURN_AND_REFUND_POLICY_SCREEN);
                    },
                  ),
                  InkWell(
                    child: Text(
                      'Term & Condition',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      Get.toNamed(TERMS_AND_CONDITION_SCREEN);
                    },
                  ),
                  InkWell(
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                          fontSize: 16,
                          height: kDrawerFontSizeHeight,
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppConstant.font_mukta),
                    ),
                    onTap: () {
                      userController.signOutUser();
                    },
                  ),
                  Container(
                    height: Get.height * 0.2,
                    child: Image.asset(
                      'assets/images/logo-large-orange.png',
                      fit: BoxFit.contain,
                      width: 140.0,
                      height: 40.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
