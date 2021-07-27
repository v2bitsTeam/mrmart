import 'package:mr_mart/AppHelper/Helper.dart';
import 'package:mr_mart/Controllers/my_order_controller.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartItemsWidget extends StatefulWidget {
  final orderId;

  CartItemsWidget({Key key, this.orderId}) : super(key: key);

  @override
  _CartItemsWidgetState createState() => _CartItemsWidgetState();
}

class _CartItemsWidgetState extends State<CartItemsWidget> {
  final MyOrdersController myOrderController = Get.find();
  final currencyFormatter =
      NumberFormat.currency(name: "en_IN", decimalDigits: 2, symbol: "");
  bool isLast;
  bool isLoading = true;
  var cartItems = [];

  @override
  void initState() {
    super.initState();
    fetchOrderDetails();
  }

  void fetchOrderDetails() async {
    var response = await myOrderController.fetchOrderDetails(widget.orderId);
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
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                backgroundColor: Colors.primaries[0],
                strokeWidth: 5.0,
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                isLast = index == cartItems.length - 1;
                return orderItemsCard(cartItems[index], context, isLast);
              },
            ),
    );
  }

  Widget orderItemsCard(dynamic orderItem, BuildContext context, bool isLast) {
    return Column(
      children: [
        (orderItem != null)
            ? orderProduct(context, orderItem)
            : Container(child: Center(child: CircularProgressIndicator())),
        (isLast)
            ? Container()
            : Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black.withOpacity(.2),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
      ],
    );
  }

  Widget orderProduct(BuildContext context, dynamic orderItem) {
    return Container(
      width: Get.width * 0.99,
      height: Get.height * 0.12,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Get.height * 0.11,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: orderItem != null && orderItem.image != null
                        ? Image.network(
                            '${AppConstant.mediaUrl}${orderItem.image}',
                            fit: BoxFit.contain,
                          )
                        : Container(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          '${orderItem?.name}',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Themes.textColor,
                            fontSize: Dimension.textSize,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          text:
                              '${AppConstant.currencySymbol}${currencyFormatter.format(double.tryParse(Helper.calculateDiscountedPrice(double.parse(orderItem?.price), int.parse(orderItem?.discount))))}  ',
                          style: Theme.of(context).textTheme.bodyText1,
                          children: [
                            TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(
                                      color: Themes.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                text:
                                    '${AppConstant.currencySymbol}${currencyFormatter.format(double.tryParse(orderItem?.price))}')
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'Sub Total: ${AppConstant.currencySymbol} ${currencyFormatter.format(double.parse(Helper.calculateDiscountedPrice(double.parse(orderItem?.price), int.parse(orderItem?.discount))) * int.parse(orderItem?.items))}',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontSize: 14, height: 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 100,
              padding: EdgeInsets.only(right: 0),
              child: TextField(
                controller: TextEditingController(text: orderItem.items),
                enabled: false,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(4.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
