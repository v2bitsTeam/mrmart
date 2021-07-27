import 'dart:ui';
import 'dart:async';
import 'dart:io';
import 'package:mr_mart/AppHelper/Helper.dart';
import 'package:mr_mart/Controllers/cart_controller.dart';
import 'package:mr_mart/Controllers/categories_controller.dart';
import 'package:mr_mart/Controllers/products_controller.dart';
import 'package:mr_mart/Controllers/user_controller.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/Widgets/ShowMessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/Providers/HomePageProvider.dart';
import 'package:mr_mart/Widgets/GridAnimation.dart';
import 'package:provider/provider.dart';
import 'package:mr_mart/ui/category/trendings_item/trending_items_screen.dart';
import 'package:mr_mart/ui/category/Items_details/item_details_screen.dart';
import 'package:mr_mart/ui/filter/filter_screen.dart';
import '../main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?',
                style: Theme.of(context).textTheme.headline1),
            content: Text('Do you want to exit the App?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.blue)),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: Text('Yes',
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .copyWith(color: Colors.red)),
              ),
            ],
          ),
        ) ??
        false;
  }

  HomePageProvider provider;
  double invisibleHeight = (Get.height * 0.15) * 0.2;
  bool isInCart = false;
  final UserController userController = Get.find();
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final ProductsController productsController = Get.put(ProductsController());
  final CartController cartController = Get.find();

  @override
  void initState() {
    super.initState();
    cartController.fetchCart(userController.user.value.uid);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageProvider>(
      create: (_) => HomePageProvider(),
      child: Consumer<HomePageProvider>(
        builder: (context, model, child) {
          provider = model;
          return Scaffold(
            body: WillPopScope(onWillPop: _onWillPop, child: mainView()),
          );
        },
      ),
    );
  }

  Widget mainView() {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: ListView(
              padding: EdgeInsets.only(top: invisibleHeight + Dimension.size50),
              children: [
                slider(),
                Obx(() => (categoriesController.categories.length > 0)
                    ? allCategory()
                    : Container()),
                titleHeader(
                  title: language.trendingProducts,
                  press: TrendingItemsScreen(),
                ),
                Obx(() => (productsController.products.length > 0)
                    ? trendingItem()
                    : Container()),
                titleHeader(
                  title: language.recommendedCategories,
                  press: null,
                ),
                Obx(() => (categoriesController.categories.length > 0)
                    ? recommendedItem()
                    : Container()),
                SizedBox(
                  height: Get.height * 0.05,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topMenu() {
    return Container(
      decoration: BoxDecoration(
        color: Themes.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Dimension.size5),
          bottomRight: Radius.circular(Dimension.size5),
        ),
        boxShadow: Themes.defaultShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 80,
              padding: EdgeInsets.all(Dimension.size8),
              margin: EdgeInsets.all(Dimension.padding)
                  .copyWith(top: invisibleHeight + Dimension.size20),
              decoration: BoxDecoration(
                color: Themes.cardBackBlueLite,
                borderRadius: BorderRadius.circular(Dimension.size3),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: SvgPicture.asset(
                      'assets/icons/navigation.svg',
                      height: Dimension.size34,
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: kDefaultPadding2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text(
                              language.deliveryTo,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Themes.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FilterScreen()),
              );
            },
            child: Container(
              height: 80,
              padding: EdgeInsets.all(Dimension.size8)
                  .copyWith(left: Get.width * 0.07, right: Get.width * 0.07),
              margin: EdgeInsets.all(Dimension.padding)
                  .copyWith(top: invisibleHeight + Dimension.size20, left: 0),
              decoration: BoxDecoration(
                color: Themes.cardBackBlueLite,
                borderRadius: BorderRadius.circular(Dimension.size3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/filter.svg',
                    height: Dimension.size30,
                  ),
                  SizedBox(
                      // height: Dimension.Size_5,
                      ),
                  Text(
                    language.filter,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget slider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: Get.height * 0.21,
        viewportFraction: 0.9,
        autoPlay: true,
      ),
      items: [1, 2, 3].map((i) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ItemDetailsScreen()),
            );
          },
          child: Container(
            width: Get.width,
            margin: EdgeInsets.only(
              left: Dimension.size5,
              right: Dimension.size5,
              bottom: Dimension.padding,
            ),
            decoration: BoxDecoration(
                color: Themes.white,
                borderRadius: BorderRadius.circular(Dimension.size10),
                boxShadow: Themes.defaultShadow,
                image: DecorationImage(
                    image: AssetImage('assets/images/slider/slider$i.jpg'),
                    fit: BoxFit.fill)),
          ),
        );
      }).toList(),
    );
  }

  Widget allCategory() {
    return Container(
      height: Dimension.size70,
      margin: EdgeInsets.only(top: Dimension.size5),
      child: Obx(
        () => ListView(
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
      ),
    );
  }

  Widget singleCategory(String catName, String catId, int index) {
    Color color = Colors.primaries[index % Colors.primaries.length];

    return Column(
      children: [
        Container(
          height: Dimension.size50,
          margin: EdgeInsets.only(
            left: Dimension.size10,
            right: categoriesController.categories.length - 1 == index
                ? Dimension.size10
                : 0,
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.only(
            left: Dimension.size30,
            right: Dimension.size30,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Dimension.size24),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: Dimension.size10,
                offset:
                    Offset(0, Dimension.size5), // changes position of shadow
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              if (catId == "0") {
                productsController.fetchProducts();
              } else {
                productsController.fetchProductsByCatId(catId);
              }
              Get.toNamed(CATEGORY_WITH_HEADER_SCREEN, arguments: catId);
            },
            child: Text(
              catName,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: Dimension.textMedium,
                    color: Themes.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget titleHeader({String title, press}) {
    return Padding(
      padding: EdgeInsets.only(left: Dimension.padding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          )),
          press != null
              ? TextButton(
                  onPressed: () {},
                  child: InkWell(
                    child: Text(
                      language.seeAll,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    onTap: () {
                      Get.toNamed(CATEGORY_WITH_HEADER_SCREEN, arguments: "0");
                    },
                  ),
                )
              : Container(),
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

  Widget trendingItem() {
    double width = Get.width * 0.4;
    return Container(
      height: Get.height * 0.30,
      margin: EdgeInsets.only(top: Dimension.size5),
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemCount: productsController.trendingProducts.length,
          itemBuilder: (context, index) {
            checkIfItemIsInCart(productsController.trendingProducts[index].pid);
            return gridAnimation(
              column: 3,
              index: index,
              child: InkWell(
                onTap: () => Get.toNamed(
                  ITEM_DETAILS_SCREEN,
                  arguments: productsController.trendingProducts[index],
                ),
                child: Container(
                  width: width,
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.only(
                    left: Dimension.size10,
                    bottom: Dimension.padding,
                    right: 2 == index ? Dimension.size10 : 0,
                  ),
                  decoration: BoxDecoration(
                    color: Themes.white,
                    borderRadius: BorderRadius.circular(Dimension.size8),
                    boxShadow: Themes.defaultShadow,
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (productsController
                                        ?.trendingProducts[index].image.length >
                                    0)
                                ? Image.network(
                                    AppConstant.mediaUrl +
                                        productsController
                                            .trendingProducts[index].image,
                                    width: width,
                                    height: Get.height * 0.20,
                                    fit: BoxFit.contain,
                                  )
                                : Image.asset('assets/images/empty.png'),
                            Divider(
                              height: 2,
                              color: Themes.grey.withOpacity(0.1),
                              thickness: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        productsController
                                            .trendingProducts[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                                fontWeight: Dimension.textBold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: RichText(
                                          text: TextSpan(
                                            text:
                                                '${AppConstant.currencySymbol}${Helper.calculateDiscountedPrice(double.parse(productsController.trendingProducts[index].price), int.parse(productsController.trendingProducts[index].discount))} ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                            children: [
                                              TextSpan(
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2
                                                      .copyWith(
                                                          color: Themes.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough),
                                                  text: int.parse(productsController
                                                              .trendingProducts[
                                                                  index]
                                                              .discount) >
                                                          0
                                                      ? '${AppConstant.currencySymbol}${productsController.trendingProducts[index].price}'
                                                      : ''),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: isInCart
                                            ? Tooltip(
                                                message: "Already in cart",
                                                child: InkWell(
                                                  onTap: () => infoMessage(
                                                      context,
                                                      message:
                                                          'Product already in cart.'),
                                                  child: SvgPicture.asset(
                                                    'assets/icons/cart-fill-color.svg',
                                                    height: Dimension.size16,
                                                    color: Colors.black26,
                                                  ),
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () => addToCart(
                                                    productsController
                                                        .trendingProducts[index]
                                                        .pid),
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
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          width: width,
                          padding: EdgeInsets.all(Dimension.size10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              int.parse(productsController
                                          .trendingProducts[index].discount) >
                                      0
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: Themes.primary2,
                                          borderRadius: BorderRadius.circular(
                                              Dimension.size5)),
                                      padding: EdgeInsets.all(Dimension.size3)
                                          .copyWith(
                                        left: Dimension.size10,
                                        right: Dimension.size10,
                                      ),
                                      child: Text(
                                        '${productsController.trendingProducts[index].discount}% ${language.off}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(
                                              color: Themes.white,
                                              fontSize:
                                                  Dimension.textSizeSmallExtra,
                                            ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
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
      productsController.fetchProducts();
      return;
    }

    errorMessage(context, message: response['message']);
  }

  Widget recommendedItem() {
    return Obx(
      () => StaggeredGridView.countBuilder(
        primary: false,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: categoriesController.featuredCategories.length,
        padding:
            EdgeInsets.only(left: Dimension.size10, right: Dimension.size10),
        crossAxisCount: 6,
        mainAxisSpacing: Dimension.size8,
        crossAxisSpacing: Dimension.size8,
        itemBuilder: (context, index) {
          return gridAnimation(
              column: 3,
              index: index,
              child: InkWell(
                onTap: () {
                  Get.toNamed(CATEGORY_WITH_HEADER_SCREEN,
                      arguments:
                          categoriesController.featuredCategories[index].cid);
                },
                child: Container(
                  height: Get.height * 0.19,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Themes.white,
                    borderRadius: BorderRadius.circular(Dimension.size5),
                    boxShadow: Themes.defaultShadow,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (categoriesController?.featuredCategories[index]
                                  .categoryImage.length >
                              0)
                          ? Image.network(
                              AppConstant.mediaUrl +
                                  categoriesController
                                      .featuredCategories[index].categoryImage,
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                              height: Get.height * 0.12,
                            )
                          : Image.asset(
                              'assets/images/empty.png',
                              height: Get.height * 0.12,
                            ),
                      Divider(
                        height: 2,
                        color: Themes.grey.withOpacity(0.1),
                        thickness: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.all(Dimension.size5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              categoriesController
                                  .featuredCategories[index].categoryName,
                              style: Theme.of(context).textTheme.bodyText1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      ),
    );
  }
}
