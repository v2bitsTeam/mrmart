import 'package:MrMart/Controllers/cart_controller.dart';
import 'package:MrMart/Controllers/products_controller.dart';
import 'package:MrMart/Controllers/user_controller.dart';
import 'package:MrMart/Services/http_services.dart';
import 'package:MrMart/Widgets/ShowMessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:get/get.dart';
import 'dart:ui';

class CustomDeleteDialog extends StatelessWidget {
  final name;
  final cartId;
  CustomDeleteDialog({this.name = "", this.cartId = ""});

  final UserController userController = Get.find();
  final ProductsController productsController = Get.find();
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 13.0, right: 8.0),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 0.0,
                    offset: Offset(0.0, 0.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                SvgPicture.asset(
                  'assets/icons/delete_item_circle.svg',
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Are you sure you want to remove ',
                        style: Theme.of(context).textTheme.subtitle1,
                        children: [
                          TextSpan(
                              style: Theme.of(context).textTheme.headline1,
                              text: '\“$name\”'),
                          TextSpan(
                              text: ' from your cart items ?',
                              style: Theme.of(context).textTheme.subtitle1),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: Get.width * 0.3,
                        height: 45,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            top: Dimension.Size_3, bottom: Dimension.Size_3),
                        decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(
                          'No',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Colors.black,
                              fontWeight: Dimension.textMedium),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      onTap: () => removeItemFromCart(context),
                      child: Container(
                        width: Get.width * 0.30,
                        height: 45,
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            top: Dimension.Size_3, bottom: Dimension.Size_3),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(7)),
                        child: Text(
                          'Remove',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: Themes.White,
                              fontWeight: Dimension.textMedium),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: -2.0,
            top: -2.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 35,
                  width: 35,
                  child: Center(
                    child: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.red,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void removeItemFromCart(BuildContext context) async {
    var response = await HTTPServices.removeFromCart(cartId);

    if (response == null) {
      Navigator.of(context).pop();
      errorMessage(context,
          message: "Something went wrong. Please, try again.");
      return;
    }

    if (response['status']) {
      Navigator.of(context).pop();
      successMessage(context, message: "Item deleted successfully.");
      cartController.fetchCart(userController.user.value.uid);
      productsController.fetchProducts();
      return;
    }
    Navigator.of(context).pop();
    errorMessage(context, message: response['message']);
  }
}
