import 'dart:io';
import 'package:mr_mart/Models/MyOrderItems.dart';
import 'package:mr_mart/Models/MyOrders.dart';
import 'package:mr_mart/Models/cart.dart';
import 'package:mr_mart/Models/categories.dart';
import 'package:mr_mart/Models/pincodes.dart';
import 'package:mr_mart/Models/products.dart';
import 'package:mr_mart/Models/user.dart';
import 'package:mr_mart/app_components/AppConstant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

class HTTPServices {
  static var client = http.Client();

  static Future<User> fetchUser(String mobile, String password) async {
    String url = "login.php";
    Map<String, String> body = {"mobile": mobile, "password": password};

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);

    if (response.statusCode == 200) {
      return userFromJson(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> createUser(
    File image,
    String name,
    String email,
    String mobile,
    String password,
    String location,
    String city,
    String state,
    String pincode,
  ) async {
    String url = "register_new.php";

    var dio = new Dio();
    dio.interceptors.add(LogInterceptor());
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;

    FormData formData = FormData.fromMap({
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
      "location": location,
      "city": city,
      "state": state,
      "pincode": pincode,
      'profile_image': image != null
          ? await MultipartFile.fromFile(image.path,
              filename: '$mobile${extension(image.path)}')
          : "",
    });

    var response = await dio.post(AppConstant.baseUrl + url,
        data: formData,
        options: Options(
          method: 'POST',
          responseType: ResponseType.json,
          headers: {
            "content-type":
                "multipart/form-data; boundary= ${formData.boundary}"
          },
        ));

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  static Future<Map<String, dynamic>> updateUser(
    String userId,
    String userMobile,
    File image,
    String name,
    String email,
    String location,
    String city,
    String state,
    String pincode,
    bool imageEdited,
    String oldImage,
  ) async {
    String url = "update_profile.php";

    var dio = new Dio();
    dio.interceptors.add(LogInterceptor());
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;

    FormData formData = FormData.fromMap({
      "uid": userId,
      "name": name,
      "email": email,
      "location": location,
      "city": city,
      "state": state,
      "pincode": pincode,
      "imageEdited": imageEdited,
      "oldimage": oldImage,
      'profile_image': image != null
          ? await MultipartFile.fromFile(image.path,
              filename: '$userMobile${extension(image.path)}')
          : "",
    });

    var response = await dio.post(
      AppConstant.baseUrl + url,
      data: formData,
      options: Options(
        method: 'POST',
        responseType: ResponseType.json,
        headers: {
          "content-type": "multipart/form-data; boundary= ${formData.boundary}"
        },
      ),
    );

    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }

  static Future<Map<String, dynamic>> forgotPasswordSendEmail(
      String mobile) async {
    String url = "forgotpassword.php";
    Map<String, String> body = {
      "mobile": mobile,
    };

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> updatePassword(
      String newPassword, String oldPassword, String userId) async {
    String url = "update_password.php";

    Map<String, String> body = {
      "uid": userId,
      "oldpassword": oldPassword,
      "newpassword": newPassword,
    };

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Pincodes> fetchPincodes() async {
    String url = "get_pincodes.php";

    var response = await client.get(Uri.parse(AppConstant.baseUrl + url));

    if (response.statusCode == 200) {
      return pincodesFromJson(response.body);
    }
    return null;
  }

  static Future<Categories> fetchCategories() async {
    String url = "get_all_categories.php";

    var response = await client.get(Uri.parse(AppConstant.baseUrl + url));

    if (response.statusCode == 200) {
      return categoriesFromJson(response.body);
    }
    return null;
  }

  static Future<Products> fetchProducts() async {
    String url = "get_all_products.php";

    var response = await client.get(Uri.parse(AppConstant.baseUrl + url));

    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    return null;
  }

  static Future<Products> fetchProductsByCatId(String catId) async {
    String url = "get_products_by_categoryId.php";
    Map<String, String> body = {"cid": catId};

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);

    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    return null;
  }

  static Future<Cart> fetchCart(String userId) async {
    String url = "get_current_cart_uid.php";
    Map<String, String> body = {"uid": userId};

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);
    if (response.statusCode == 200) {
      return cartFromJson(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> addToCart(
      String productId, String userId, String quantity) async {
    String url = "add_to_cart.php";
    Map<String, String> body = {
      "uid": userId,
      "pid": productId,
      "items": quantity
    };

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> removeFromCart(String cartId) async {
    String url = "delete_cart_item.php";
    Map<String, String> body = {"cart_id": cartId};

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> updateCart(
      String cartId, String quantity) async {
    String url = "update_cart_items.php";
    Map<String, String> body = {"cart_id": cartId, "items": quantity};

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<MyOrders> fetchOrders(String userId) async {
    String url = "get_orders_uid.php";
    Map<String, String> body = {"uid": userId};

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);
    if (response.statusCode == 200) {
      return myOrdersFromJson(response.body);
    }
    return null;
  }

  static Future<Cart> fetchOrderItems(String orderId) async {
    String url = "get_cart_order_id.php";
    Map<String, String> body = {"oid": orderId};

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);
    if (response.statusCode == 200) {
      return cartFromJson(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> initializeRazorpayOrder(
      Map<String, String> body) async {
    String url = "initialize_razorpay_order.php";

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static dynamic addRazorpayOrder(Map<String, dynamic> body) async {
    String url = "add_razorpay_order.php";

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> placeOrder(
      Map<String, String> body) async {
    String url = "add_order.php";

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<MyOrderItems> fetchOrderDetails(String orderId) async {
    String url = "get_cart_order_id.php";
    Map<String, String> body = {"oid": orderId};

    var response =
        await client.post(Uri.parse(AppConstant.baseUrl + url), body: body);
    if (response.statusCode == 200) {
      return myOrderItemsFromJson(response.body);
    }
    return null;
  }
}
