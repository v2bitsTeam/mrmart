import 'package:MrMart/Controllers/user_controller.dart';
import 'package:MrMart/Services/http_services.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cart = [].obs;
  final cartActualTotal = 0.0.obs;
  final cartTotal = 0.0.obs;
  final discount = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updateCartActualTotal(double total) {
    cartActualTotal.value = total;
  }

  void updateCartTotal(double total) {
    cartTotal.value = total;
  }

  void updateDiscountAmount(double amount) {
    discount.value = amount;
  }

  void fetchCart(String userId) async {
    var response = await HTTPServices.fetchCart(userId);
    if (response.status) {
      cart.assignAll(response.data);
    } else if (response.message == "No Record Found") {
      cart.clear();
    }
  }

  Future<Map<String, dynamic>> addToCart(
      String productId, UserController userController) async {
    var response = await HTTPServices.addToCart(
        productId, userController.user.value.uid, "1");

    return response;
  }

  void resetCart() {
    cart.clear();
    cartActualTotal.value = 0.0;
    cartTotal.value = 0.0;
    discount.value = 0.0;
  }
}
