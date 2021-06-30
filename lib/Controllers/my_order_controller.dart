import 'package:MrMart/Models/MyOrderItems.dart';
import 'package:MrMart/Services/http_services.dart';
import 'package:get/get.dart';

class MyOrdersController extends GetxController {
  final orders = [].obs;
  final orderItems = [].obs;

  get currentOrders => orders
      .where((order) =>
          order?.status == "Pending Confirmation" ||
          order?.status == "Order Accepted" ||
          order?.status == "accepted Order" ||
          order?.status == "Order Processing")
      .toList();

  get pastOrders => orders
      .where((order) =>
          order?.status == "Order Declined" ||
          order?.status == "delivered Order")
      .toList();

  @override
  void onInit() {
    super.onInit();
  }

  void fetchOrders(String userId) async {
    var response = await HTTPServices.fetchOrders(userId);

    if (response.status) {
      orders.assignAll(response.data);
    }
  }

  Future<bool> fetchOrderItems(String orderId) async {
    var response = await HTTPServices.fetchOrderItems(orderId);

    if (response.status) {
      orderItems.assignAll(response.data);
      return true;
    }
    return false;
  }

  Future<Map<String, dynamic>> placeOrder(Map<String, String> body) async {
    var response = await HTTPServices.placeOrder(body);

    if (response['status']) {
      return response;
    }
    return null;
  }

  Future<List<OrderItems>> fetchOrderDetails(String orderId,
      {bool isOrderPlacedScreen = false}) async {
    var response = await HTTPServices.fetchOrderDetails(orderId);

    if (response.status) {
      if (isOrderPlacedScreen) {
        orders.assignAll(response.order);
        return response.orderItems;
      }

      orderItems.assignAll(response.orderItems);
      return response.orderItems;
    }
    return null;
  }
}
