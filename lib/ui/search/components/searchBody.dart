import 'package:mr_mart/Controllers/products_controller.dart';
import 'package:mr_mart/Controllers/search_controller.dart';
import 'package:mr_mart/Models/products.dart';
import 'package:mr_mart/Route/Route.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/constants.dart';
import 'package:get/get.dart';
import 'package:shape_of_view/shape_of_view.dart';

class SearchBody extends StatelessWidget {
  final TextEditingController searchTextController = TextEditingController();
  final ProductsController productsController = Get.find();
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Get.height,
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        children: [
          SizedBox(height: 45),
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: kDefaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: TextField(
                        onChanged: search,
                        style: Theme.of(context).textTheme.headline5,
                        cursorColor: Colors.black,
                        controller: searchTextController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kBackgroundColor,
                          prefixIcon: Icon(
                            Icons.search,
                            size: 25,
                            color: kSubTextColor,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 14.0,
                            bottom: 8.0,
                            top: 14.0,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          border: InputBorder.none,
                          hintText: "Search products...",
                          hintStyle: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: ShapeOfView(
                          height: 50,
                          width: 50,
                          elevation: 0,
                          shape: RoundRectShape(
                            borderRadius: BorderRadius.circular(5),
                            borderColor: Colors.black,
                            borderWidth: 0,
                          ),
                          child: Container(
                            color: kSearchCLear_iconBG,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.clear,
                                size: 25,
                                color: kSearchCLear_icon,
                              ),
                            ),
                          ),
                        ),
                        onTap: clearSearchTerm,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search Results',
                  textDirection: TextDirection.ltr,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Obx(
                  () => searchController.searchResults.length > 0
                      ? InkWell(
                          child: Text(
                            "Clear All",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: kClearAll,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              height: 1,
                            ),
                          ),
                          onTap: clearSearchTerm,
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => searchResults(searchController.searchResults),
            ),
          ),
        ],
      ),
    );
  }

  void clearSearchTerm() {
    searchTextController.text = "";
    searchController.resetSearchResults();
  }

  void search(String searchTerm) {
    searchController.resetSearchResults();

    if (searchTerm.length == 0) {
      searchController.resetSearchResults();
      return;
    }

    for (int i = 0; i < productsController.products.length; i++) {
      if (productsController.products[i].name
          .toLowerCase()
          .contains(searchTerm.toLowerCase())) {
        searchController.updateSearchResults(productsController.products[i]);
      }
    }
  }

  Widget searchResults(products) {
    if (products.length == 0) {
      return Container(
        alignment: Alignment.center,
        child: searchTextController.text.length != 0
            ? Text(
                "Sorry, Nothing found. Try searching for something else.",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              )
            : Text(
                "What are you looking for today?",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
      );
    }
    return ListView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return searchResult(products[index], context, index, products.length);
      },
    );
  }

  Widget searchResult(
      Product product, BuildContext context, int index, int noOfProducts) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: 0.0,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10.0,
          ),
          Container(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () => goToProductDetailsScreen(product),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  product.image != "" || product.image != null
                      ? Image.network(
                          AppConstant.mediaUrl + product.image,
                          fit: BoxFit.contain,
                          height: 50.0,
                          width: 50.0,
                          frameBuilder: (BuildContext context, Widget child,
                              int frame, bool wasSynchronouslyLoaded) {
                            if (wasSynchronouslyLoaded) {
                              return child;
                            }
                            return AnimatedOpacity(
                              child: child,
                              opacity: frame == null ? 0 : 1,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeOut,
                            );
                          },
                        )
                      : Image.asset('assets/images/empty.png'),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 50.0,
                    alignment: Alignment.center,
                    child: Text(
                      product.name,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          if (index + 1 != noOfProducts) Divider(),
        ],
      ),
    );
  }

  void goToProductDetailsScreen(Product product) {
    Get.toNamed(ITEM_DETAILS_SCREEN, arguments: product);
  }
}
