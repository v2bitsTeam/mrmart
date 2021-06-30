import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:MrMart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/ui/cart/cart_screen.dart';
import 'package:MrMart/ui/notification/notification_screen.dart';
import 'package:MrMart/ui/checkout/add_new_card/components/AddNewCardBody.dart';
import 'package:MrMart/ui/category/trendings_item/components/TrendingItemsBody.dart';
import 'package:MrMart/app_components/constants.dart';

class AddNewCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text("Add New Card"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/cart_white.svg'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              child: SvgPicture.asset('assets/icons/notification.svg'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationScreen()),
                );
              },
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*Container(
                child: Image.asset(
                  'assets/images/checkout/checkout_header_image.png',
                  fit: BoxFit.fill,
                ),
              ),*/
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: AddNewCardBody(),
    );
  }
}

/*

  @override
  Widget build(BuildContext context) {
    return CustomDrawer(
      body: BaseActivity(
        title: language.Main_Page_Tab[provider.selectedTab],
        automaticLeading: false,
        body: mainView(),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(Dimension.Size_10),
          decoration: BoxDecoration(
            color: Themes.White,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(Dimension.Padding),
                topLeft: Radius.circular(Dimension.Padding)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: Dimension.Size_30,
                offset: Offset(
                    0, Dimension.Padding), // changes position of shadow
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
                    height: Dimension.Size_24,
                  ),
                  title: Text(
                    value,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Themes.Primary),
                  ),
                  selectedColor: Themes.Primary,
                )))
                .values
                .toList(),
          ),
        ),
      ),
      drawer: buildDrawerNav(),
    );
  }
}
*/
