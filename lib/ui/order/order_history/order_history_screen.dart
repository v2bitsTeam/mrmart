import 'package:mr_mart/Controllers/my_order_controller.dart';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/ui/order/order_history/tabs/CartItemsWidget.dart';
import 'package:mr_mart/ui/order/order_history/tabs/CartTextWidget.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/app_components/StyleScheme.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends StatefulWidget {
  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final MyOrdersController myOrderController = Get.put(MyOrdersController());

  final UserController userController = Get.find();

  @override
  void initState() {
    super.initState();
    myOrderController.fetchOrders(userController.user.value.uid);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                title: Text("Order History"),
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
                    padding: EdgeInsets.only(right: 12.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.home,
                        size: 28.0,
                      ),
                      onPressed: () => Get.toNamed(MAIN_PAGE),
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
                                text: "Ongoing Order",
                                icon: Icon(Icons.border_inner_rounded)),
                            Tab(
                                text: "Past Order",
                                icon: Icon(Icons.card_membership_sharp)),
                          ]),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: Obx(
            () => TabBarView(
              children: <Widget>[
                ordersTab(myOrderController.currentOrders, false),
                ordersTab(myOrderController.pastOrders, true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ordersTab(orders, bool isPastOrder) {
    return Container(
      color: kBackgroundColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: orders.length != 0
                ? ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return orderCard(orders[index], isPastOrder);
                    },
                  )
                : Container(
                    height: Get.height * 0.7,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/voucher/bg_no_voucher.png"),
                        SizedBox(height: 20.0),
                        Text("Sorry, No orders found.",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget orderCard(dynamic order, bool isPastOrder) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          SizedBox(height: 15),
          CartTextWidget(
            order,
            isPastOrder,
          ),
          CartItemsWidget(
            orderId: order.oid,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
