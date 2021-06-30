import 'package:MrMart/Controllers/categories_controller.dart';
import 'package:MrMart/Controllers/products_controller.dart';
import 'package:MrMart/ui/category/trendings_item/components/TrendingItems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:MrMart/app_components/constants.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/Language/Language.dart';
import 'dart:ui';

Language language = Language();

class CategoryBody extends StatefulWidget {
  final double paddingHeight;
  final String isActive;
  CategoryBody(this.paddingHeight, {this.isActive = "0"});

  @override
  _CategoryBodyState createState() => _CategoryBodyState(isActive);
}

class _CategoryBodyState extends State<CategoryBody> {
  final CategoriesController categoriesController = Get.find();
  final ProductsController productsController = Get.find();
  String isActive;

  _CategoryBodyState(this.isActive);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned.fill(
            child: Obx(
              () => ListView(
                padding: EdgeInsets.only(top: widget.paddingHeight),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      'Filter By  Category',
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  allCategory(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TrendingItems(
                        products: productsController.productsByCatId),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget allCategory() {
    return Container(
      height: Dimension.Size_70,
      margin: EdgeInsets.only(top: Dimension.Size_5),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        children: categoriesController.categories
            .asMap()
            .map((index, element) => MapEntry(index,
                singleCategory(element.categoryName, element.cid, index)))
            .values
            .toList(),
      ),
    );
  }

  Widget singleCategory(String catName, String catId, int index) {
    Color color = (isActive == catId) ? Themes.Button_Color1 : Themes.Grey;

    return Column(
      children: [
        Container(
          height: Dimension.Size_50,
          margin: EdgeInsets.only(
              left: Dimension.Size_10,
              right: categoriesController.categories.length - 1 == index
                  ? Dimension.Size_10
                  : 0),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
              left: Dimension.Size_30, right: Dimension.Size_30),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Dimension.Size_24),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: Dimension.Size_10,
                offset:
                    Offset(0, Dimension.Size_5), // changes position of shadow
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              productsController.activeCatId.value = catId;
              setState(() {
                isActive = catId;
              });
              if (catId == "0") {
                productsController.fetchProducts();
                return;
              }
              productsController.fetchProductsByCatId(catId);
            },
            child: Text(
              catName,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: Dimension.textMedium, color: Themes.White),
            ),
          ),
        ),
      ],
    );
  }
}
