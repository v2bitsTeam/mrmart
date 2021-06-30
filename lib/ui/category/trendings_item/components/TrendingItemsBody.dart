import 'package:MrMart/Controllers/categories_controller.dart';
import 'package:MrMart/Controllers/products_controller.dart';
import 'package:MrMart/ui/category/trendings_item/components/TrendingItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class TrendingItemsBody extends StatefulWidget {
  @override
  _TrendingItemsBodyState createState() => _TrendingItemsBodyState();
}

class _TrendingItemsBodyState extends State<TrendingItemsBody> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final ProductsController productsController = Get.put(ProductsController());
  bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          SizedBox(
            height: 0,
          ),
          TrendingItems(products: productsController.trendingProducts),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
