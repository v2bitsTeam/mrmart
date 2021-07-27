import 'package:mr_mart/Controllers/cart_controller.dart';
import 'package:mr_mart/Controllers/categories_controller.dart';
import 'package:mr_mart/Controllers/products_controller.dart';
import 'package:mr_mart/ui/category/components/categoryBody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mr_mart/ui/cart/cart_screen.dart';
import 'package:get/get.dart';

class CategoryWithHeaderScreen extends StatelessWidget {
  final String categoryId = Get.arguments;
  final CategoriesController categoriesController = Get.find();
  final ProductsController productsController = Get.find();
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text("Products"),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/header.png"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 24.0,
              top: 16.0,
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
                              builder: (context) => CartScreen(),
                            ),
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
          preferredSize: Size.fromHeight(40.0),
          child: Container(),
        ),
      ),
      body: CategoryBody(
        0.0,
        isActive: categoryId,
      ),
    );
  }
}
