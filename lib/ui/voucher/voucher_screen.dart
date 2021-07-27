import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/ui/voucher/tabs/TabCollectVoucherScreen.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/app_components/StyleScheme.dart';
import 'package:mr_mart/ui/voucher/tabs/TabMyVoucherScreen.dart';
import 'package:mr_mart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:mr_mart/ui/notification/notification_screen.dart';

class VoucherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text("Voucher"),
                forceElevated: innerBoxIsScrolled,
                snap: false,
                pinned: true,
                floating: false,
                flexibleSpace: Container(
                  height: 100,
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
                          MaterialPageRoute(
                              builder: (context) => CartSummaryScreen()),
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
                          MaterialPageRoute(
                              builder: (context) => NotificationScreen()),
                        );
                      },
                    ),
                  ),
                ],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(75),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TabBar(
                          indicatorColor: kPrimaryColor2,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 3,
                          labelColor: kTextColor,
                          labelStyle: tabHeadingStyle,
                          tabs: <Tab>[
                            Tab(
                                text: "Collect Voucher",
                                icon: Icon(Icons.view_quilt_outlined)),
                            Tab(
                                text: "My Voucher",
                                icon: Icon(Icons.card_giftcard)),
                          ]),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              TabCollectVoucherScreen(),
              TabMyVoucherScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
