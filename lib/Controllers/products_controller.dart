import 'package:MrMart/Services/http_services.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final products = [].obs;
  final productsByCatId = [].obs;
  final activeCatId = "0".obs;

  get trendingProducts {
    if (products.length != 0) {
      return products
          .where((product) =>
              product.featured == "yes" || product.featured == "true")
          .toList();
    }
    return [];
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    var response = await HTTPServices.fetchProducts();

    if (response.status) {
      products.assignAll(response.data);
      productsByCatId.assignAll(response.data);
    }
  }

  void fetchProductsByCatId(String catId) async {
    var response = await HTTPServices.fetchProductsByCatId(catId);
    productsByCatId(response.data);
  }
}
