import 'package:mr_mart/Controllers/my_order_controller.dart';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Models/MyOrderItems.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/Controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mr_mart/ui/order/order_history/tabs/CartItemsWidget.dart';
import 'package:mr_mart/ui/order/order_history/tabs/CartTextWidget.dart';

class Body extends StatefulWidget {
  final String orderId;
  Body(this.orderId);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final MyOrdersController myOrderController = Get.put(MyOrdersController());
  final CartController cartController = Get.find();
  final UserController userController = Get.find();
  final currencyFormatter =
      NumberFormat.currency(name: "en_IN", decimalDigits: 2, symbol: "");
  bool isLoading = true;
  List cartItems = [];

  @override
  void initState() {
    super.initState();
    fetchOrderDetails();
  }

  @override
  void dispose() {
    myOrderController.dispose();
    super.dispose();
  }

  void fetchOrderDetails() async {
    var response = await myOrderController.fetchOrderDetails(widget.orderId,
        isOrderPlacedScreen: true);
    if (response != null) {
      if (mounted) {
        setState(() {
          isLoading = false;
          cartItems = response;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          isLoading = false;
          cartItems = [];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(16, 0, 16, .0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        bottom: 4.0,
                      ),
                      child: Text(
                        'Thank you for placing an order with us. We are happy to have you as our customer.',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        bottom: 16.0,
                      ),
                      child: Text(
                        'Our team will get this assigned and delivered at the earliest.',
                        style: TextStyle(
                          color: Themes.textColor,
                          fontSize: 16.0,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Obx(() => myOrderController.orders.length > 0
                  ? orderCard(myOrderController.orders[0], false)
                  : Container()),
            ),
            Container(
              width: Get.width,
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Go to My Orders",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Themes.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      Get.offNamed(ORDER_HISTORY_SCREEN);
                    },
                  ),
                  ElevatedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Go to Home",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Themes.buttonColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      cartController.resetCart();
                      Get.offNamed(
                        MAIN_PAGE,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderCard(Order order, bool isPastOrder) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
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
