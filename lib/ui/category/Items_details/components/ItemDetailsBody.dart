import 'package:MrMart/AppHelper/Helper.dart';
import 'package:MrMart/Controllers/products_controller.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:ui';

class ItemDetailsBody extends StatefulWidget {
  final dynamic product;
  ItemDetailsBody(this.product);

  @override
  _ItemDetailsBodyState createState() => _ItemDetailsBodyState(this.product);
}

class _ItemDetailsBodyState extends State<ItemDetailsBody> {
  final dynamic product;
  ProductsController productsController = Get.find();

  _ItemDetailsBodyState(this.product);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: Get.height * 0.25,
            color: kBackgroundColor,
            child: Center(
              child: product.image != null || product.image != ""
                  ? Image.network(
                      AppConstant.MediaUrl + product.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/empty.png'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 0.2,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Row(
                        children: [
                          Text(
                            '${AppConstant.currencySymbol} ${Helper.calculateDiscountedPrice(double.parse(product.price), int.parse(product.discount))} ',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            '${AppConstant.currencySymbol}${product.price}',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontSize: 14,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Items available: ${product.instock}',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Discount: ${product.discount}%',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 0.2,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${product.description}',
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
