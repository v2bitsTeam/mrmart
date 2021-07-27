import 'package:mr_mart/AppHelper/Helper.dart';
import 'package:mr_mart/Controllers/cart_controller.dart';
import 'package:mr_mart/Controllers/products_controller.dart';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Models/products.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/Widgets/GridAnimation.dart';
import 'package:mr_mart/Widgets/ShowMessage.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TrendingItems extends StatefulWidget {
  final dynamic products;

  const TrendingItems({Key key, this.products}) : super(key: key);
  @override
  _TrendingItemsState createState() => _TrendingItemsState(products);
}

class _TrendingItemsState extends State<TrendingItems> {
  final dynamic products;
  bool isInCart = false;
  final UserController userController = Get.find();
  final ProductsController productsController = Get.find();
  final CartController cartController = Get.find();

  _TrendingItemsState(this.products);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => products.length > 0
          ? StaggeredGridView.countBuilder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: products.length,
              padding: EdgeInsets.only(
                left: Dimension.size10,
                right: Dimension.size10,
              ),
              crossAxisCount: 2,
              mainAxisSpacing: Dimension.size8,
              crossAxisSpacing: Dimension.size8,
              itemBuilder: (context, index) {
                checkIfItemIsInCart(products[index].pid);
                return gridAnimation(
                  column: 3,
                  index: index,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(ITEM_DETAILS_SCREEN,
                          arguments: products[index]);
                    },
                    child: (trendingItem(products[index])),
                  ),
                );
              },
              staggeredTileBuilder: (index) => StaggeredTile.fit(1),
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
                  Text(
                    "Sorry, No Products found.",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget trendingItem(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Themes.white,
        borderRadius: BorderRadius.circular(Dimension.size5),
        boxShadow: Themes.defaultShadow,
      ),
      height: Get.height * 0.30,
      width: Get.width * 0.44,
      margin: EdgeInsets.only(top: Dimension.size5),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: product.image != "" || product.image != null
                    ? Image.network(
                        AppConstant.mediaUrl + product.image,
                        width: 150,
                        height: Get.height * 0.20,
                        fit: BoxFit.contain,
                      )
                    : Image.asset('assets/images/empty.png'),
              ),
              Divider(
                height: 2,
                color: Themes.grey.withOpacity(0.1),
                thickness: 2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 140.0,
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: Dimension.textSizeSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(
                                text:
                                    '${AppConstant.currencySymbol}${Helper.calculateDiscountedPrice(double.parse(product.price), int.parse(product.discount))}  ',
                                style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.normal,
                                  fontSize: Dimension.textSizeSmall,
                                ),
                                children: [
                              TextSpan(
                                  style: TextStyle(
                                    color: kSubTextColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: Dimension.textSizeSmallExtra,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                  text: int.parse(product.discount) > 0
                                      ? '${AppConstant.currencySymbol}${product.price}'
                                      : '')
                            ])),
                        Container(
                          child: isInCart
                              ? Tooltip(
                                  message: "Already in cart",
                                  child: InkWell(
                                    onTap: () => infoMessage(context,
                                        message: 'Product already in cart.'),
                                    child: SvgPicture.asset(
                                      'assets/icons/cart-fill-color.svg',
                                      height: Dimension.size16,
                                      color: Colors.black26,
                                    ),
                                  ),
                                )
                              : InkWell(
                                  onTap: () => addToCart(product.pid),
                                  child: SvgPicture.asset(
                                    'assets/icons/cart-fill-color.svg',
                                    height: Dimension.size16,
                                  ),
                                ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void checkIfItemIsInCart(String productId) {
    for (int i = 0; i < cartController.cart.length; i++) {
      if (cartController.cart[i].pid == productId) {
        isInCart = true;
        return;
      }
      isInCart = false;
    }
  }

  void addToCart(String productId) async {
    var response = await cartController.addToCart(productId, userController);

    if (response == null) {
      errorMessage(context,
          message: "Something went wrong. Please, try again.");
      return;
    }

    if (response['status']) {
      successMessage(context, message: response['message']);
      cartController.fetchCart(userController.user.value.uid);

      if (productsController.activeCatId.value == "0") {
        productsController.fetchProducts();
      } else {
        productsController
            .fetchProductsByCatId(productsController.activeCatId.value);
      }

      return;
    }

    errorMessage(context, message: response['message']);
  }
}
