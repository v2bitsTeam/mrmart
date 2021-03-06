import 'package:mr_mart/Controllers/cart_controller.dart';
import 'package:mr_mart/Controllers/products_controller.dart';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Widgets/ShowMessage.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/ui/cart/cart_screen.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/ui/category/Items_details/components/ItemDetailsBody.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends StatefulWidget {
  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  dynamic product = Get.arguments;

  CartController cartController = Get.find();

  final UserController userController = Get.find();

  final ProductsController productsController = Get.find();

  bool isInCart = false;
  @override
  void initState() {
    super.initState();
    checkIfItemIsInCart(product.pid);
  }

  void checkIfItemIsInCart(String productId) {
    for (int i = 0; i < cartController.cart.length; i++) {
      if (cartController.cart == null || cartController.cart.length == 0) {
        setState(() {
          isInCart = false;
        });
        return;
      }
      if (cartController.cart[i].pid != productId) {
        setState(() {
          isInCart = false;
        });
        return;
      }
      setState(() {
        isInCart = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text("Items Details"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          highlightColor: Colors.transparent,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 24.0,
              top: 6.0,
            ),
            child: Container(
              width: 35,
              height: 35,
              child: Obx(
                () => Stack(
                  children: [
                    Positioned(
                      top: 14.0,
                      left: 0,
                      child: InkWell(
                        child: SvgPicture.asset('assets/icons/cart_white.svg'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 20.0,
                        height: 20.0,
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          cartController.cart.length.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ),
      ),
      body: ItemDetailsBody(product),
      floatingActionButton: FloatingActionButton(
        onPressed: isInCart
            ? null
            : () {
                addToCart(product.pid, context);
              },
        child: SvgPicture.asset(
          'assets/icons/cart_white.svg',
          color: isInCart ? Colors.grey : Colors.white,
        ),
        tooltip: isInCart ? "Already in cart" : "Add to cart",
        backgroundColor: isInCart ? Colors.grey[300] : Themes.buttonColor1,
      ),
    );
  }

  void addToCart(String productId, BuildContext context) async {
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
      setState(() {
        isInCart = true;
      });

      return;
    }

    errorMessage(context, message: response['message']);
  }
}
