import 'dart:ui';
import 'package:mr_mart/AppHelper/Helper.dart';
import 'package:mr_mart/Controllers/cart_controller.dart';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Models/cart.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/Services/http_services.dart';
import 'package:mr_mart/Widgets/ShowMessage.dart';
import 'package:mr_mart/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/ui_components/default_button.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/ui_components/CustomDeleteDialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final UserController userController = Get.find();
  final CartController cartController = Get.find();
  final currencyFormatter =
      NumberFormat.currency(name: "en_IN", decimalDigits: 2, symbol: "");

  @override
  void initState() {
    super.initState();
    cartController.fetchCart(userController.user.value.uid);
    if (cartController.isClosed) {
      return;
    }
    cartController.updateCartTotal(0.0);
    cartController.updateDiscountAmount(0.0);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackgroundColor,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Obx(
              () => Container(
                child: cartController.cart.length > 0
                    ? Column(
                        children: [
                          Container(
                            width: Get.width,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            padding: EdgeInsets.all(16.0),
                            color: Colors.redAccent,
                            child: Text(
                              "Minimum order value is Rs. 1000",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            padding:
                                EdgeInsets.only(top: 0, left: 16, right: 16),
                            children: cartController.cart
                                .asMap()
                                .map((index, element) => MapEntry(
                                    index, favoriteItems(element, index)))
                                .values
                                .toList(),
                          ),
                        ],
                      )
                    : Container(
                        height: Get.height * 0.7,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                "assets/images/voucher/bg_no_voucher.png"),
                            SizedBox(height: 20.0),
                            Text("Sorry, Nothing in cart.",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                ))
                          ],
                        ),
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Obx(
            () => Container(
              child: cartController.cart.length > 0
                  ? DefaultButton(
                      text: "Proceed To Cart Summary",
                      press: proceedToCartSummary,
                    )
                  : DefaultButton(
                      text: "Back to Home",
                      press: () => Get.toNamed(MAIN_PAGE),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void calculateSubTotal(CartItem element) {
    final subTotal = double.parse(Helper.calculateDiscountedPrice(
            double.parse(element.price), int.parse(element.discount))) *
        int.parse(element.items);

    final actualTotal = double.parse(
            Helper.calculateDiscountedPrice(double.parse(element.price), 0)) *
        int.parse(element.items);

    final discount = (int.tryParse(element.price) *
            int.tryParse(element.discount) *
            int.parse(element.items)) /
        100;

    double cartActualTotal = cartController.cartActualTotal.value + actualTotal;
    double cartTotal = cartController.cartTotal.value + subTotal;
    double discountTotal = cartController.discount.value + discount;

    cartController.updateCartActualTotal(cartActualTotal);
    cartController.updateCartTotal(cartTotal);
    cartController.updateDiscountAmount(discountTotal);
  }

  void proceedToCartSummary() {
    cartController.updateCartActualTotal(0.0);
    cartController.updateCartTotal(0.0);
    cartController.updateDiscountAmount(0.0);
    for (int i = 0; i < cartController.cart.length; i++) {
      calculateSubTotal(cartController.cart[i]);
    }

    Get.to(CartSummaryScreen());
  }

  Widget favoriteItems(CartItem element, int index) {
    TextEditingController quantityController = TextEditingController();
    quantityController.text = element.items;

    void updateCartItemQuantity() async {
      var response = await HTTPServices.updateCart(
          element.cartId, quantityController.text);

      if (response == null) {
        errorMessage(context,
            message: "Something went wrong. Please, try again.");
        return;
      }

      if (response['status']) {
        successMessage(context, message: "Quantity updated.");
        cartController.fetchCart(userController.user.value.uid);
        return;
      }
      errorMessage(context, message: response['message']);
    }

    void quantitySubmitted(type) {
      if (type == "add") {
        if (quantityController.text == element.instock) {
          infoMessage(context, message: "Quantity exceeds stocks");
          return;
        }
        quantityController.text =
            (int.parse(quantityController.text) + 1).toString();
      } else {
        if (quantityController.text == "1") {
          errorMessage(context, message: "Quantity can't be less than 1");
          return;
        }
        quantityController.text =
            (int.parse(quantityController.text) - 1).toString();
      }

      updateCartItemQuantity();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Card(
          child: Container(
            width: Get.width * 0.99,
            height: Get.height * 0.20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () => Get.toNamed(
                      ITEM_DETAILS_SCREEN,
                      arguments: element,
                    ),
                    child: Center(
                      child: element.image != null || element.image != ""
                          ? Image.network(
                              AppConstant.mediaUrl + element.image,
                              width: Get.width * 0.2,
                              fit: BoxFit.contain,
                            )
                          : Image.asset(
                              'assets/demo/trending0.png',
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                VerticalDivider(
                  color: Colors.grey.withOpacity(.2),
                  thickness: 1,
                  width: 1,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: InkWell(
                                onTap: () => Get.toNamed(
                                  ITEM_DETAILS_SCREEN,
                                  arguments: element,
                                ),
                                child: Text(
                                  element.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Themes.textColor,
                                    fontSize: Dimension.size20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    '${AppConstant.currencySymbol}${currencyFormatter.format(double.tryParse(Helper.calculateDiscountedPrice(double.parse(element.price), int.parse(element.discount))))}  ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                children: [
                                  TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                            color: Themes.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                      text:
                                          '${AppConstant.currencySymbol}${currencyFormatter.format(double.tryParse(element.price))}')
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove,
                                  color: Themes.primary,
                                ),
                                splashColor: Themes.primary,
                                splashRadius: 24.0,
                                onPressed: () => quantitySubmitted("remove"),
                              ),
                              Container(
                                width: 60.0,
                                child: TextField(
                                  controller: quantityController,
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    contentPadding: EdgeInsets.all(4.0),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: Themes.primary3,
                                ),
                                splashColor: Themes.primary2,
                                splashRadius: 24.0,
                                onPressed: () => quantitySubmitted("add"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20.0),
                      Text(
                        'Subtotal: ',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Themes.grey,
                            ),
                      ),
                      Text(
                        '${AppConstant.currencySymbol} ${currencyFormatter.format(double.parse(Helper.calculateDiscountedPrice(double.parse(element.price), int.parse(element.discount))) * int.parse(element.items))}',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontWeight: Dimension.textMedium,
                            ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    CustomDeleteDialog(
                                      name: element.name,
                                      cartId: element.cartId,
                                    ));
                          },
                          child: SvgPicture.asset(
                            'assets/icons/delete.svg',
                            height: Dimension.size20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
