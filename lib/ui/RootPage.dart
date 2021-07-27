import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:mr_mart/ui/category/category_screen.dart';
import 'package:mr_mart/ui/search/search_screen.dart';
import 'HomePage.dart';
import 'favorite_items/favorite_items_screen.dart';
import 'message/message_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootPage extends StatefulWidget {
  @override
  RootPageState createState() => RootPageState();
}

class RootPageState extends State<RootPage> {
  int selectedBottomBarIndex;
  Widget body;

  @override
  void initState() {
    selectedBottomBarIndex = 0;
    body = HomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: false,
        backgroundColor: Colors.white,
        body: body,
        bottomNavigationBar: buildBottomBar(),
      ),
    );
  }

  BottomNavigationBar buildBottomBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: selectedBottomBarIndex,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      items: [
        getBottomBarItem(
          'assets/icons/home-tab0.svg',
          "home",
          0,
        ),
        getBottomBarItem(
          'assets/icons/home-tab1.svg',
          'Category',
          1,
        ),
        getBottomBarItem(
          'assets/icons/home-tab2.svg',
          'Favorite',
          2,
          //badgeCount: themeAndLanguageNotifier.cartItemCount,
        ),
        getBottomBarItem(
          'assets/icons/home-tab3.svg',
          'Search',
          3,
        ),
        getBottomBarItem(
          'assets/icons/home-tab4.svg',
          'Message',
          4,
        ),
      ],
      onTap: _onBottomBarItemTapped,
    );
  }

  void _onBottomBarItemTapped(int index) {
    if (this.mounted) {
      setState(() {
        switch (index) {
          case 0:
            selectedBottomBarIndex = index;
            body = HomePage();
            break;

          case 1:
            selectedBottomBarIndex = index;
            body = CategoryScreen();
            break;

          case 2:
            selectedBottomBarIndex = index;
            //body = FavoriteScreen(root: this);
            body = FavoriteItemsScreen();
            break;

          case 3:
            selectedBottomBarIndex = index;
            body = SearchScreen();
            break;

          case 4:
            selectedBottomBarIndex = index;
            body = MessageScreen();
            break;

          default:
            break;
        }
      });
    }
  }

  BottomNavigationBarItem getBottomBarItem(
    String imagePath,
    String title,
    int position, {
    int badgeCount,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                imagePath,
                color: selectedBottomBarIndex == position
                    ? Colors.red
                    : Color(0xFFC0CFD0),
                fit: BoxFit.fitHeight,
                height: 20,
              ),
            ),
          ],
        ),
      ),
      label: title,
    );
  }
}
