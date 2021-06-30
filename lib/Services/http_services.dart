import 'dart:io';
import 'package:MrMart/Models/MyOrderItems.dart';
import 'package:MrMart/Models/MyOrders.dart';
import 'package:MrMart/Models/cart.dart';
import 'package:MrMart/Models/categories.dart';
import 'package:MrMart/Models/pincodes.dart';
import 'package:MrMart/Models/products.dart';
import 'package:MrMart/Models/user.dart';
import 'package:MrMart/app_components/AppConstant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

class HTTPServices {
  static var client = http.Client();

  static Future<User> fetchUser(String mobile, String password) async {
    String url = "login.php";
    Map<String, String> body = {"mobile": mobile, "password": password};

    var response = await client.post(AppConstant.BaseUrl + url, body: body);

    if (response.statusCode == 200) {
      return userFromJson(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> createUser(
    dynamic image,
    String name,
    String mobile,
    String password,
    String location,
    String city,
    String state,
    String pincode,
  ) async {
    String url = "register.php";
    MultipartFile multipartFile;

    var dio = new Dio();
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;
    FormData formData = new FormData();

    formData.fields.add(MapEntry("name", name));
    formData.fields.add(MapEntry("mobile", mobile));
    formData.fields.add(MapEntry("password", password));
    formData.fields.add(MapEntry("location", location));
    formData.fields.add(MapEntry("city", city));
    formData.fields.add(MapEntry("state", state));
    formData.fields.add(MapEntry("pincode", pincode));

    if (image.length != 0) {
      multipartFile = await MultipartFile.fromFile(image.path,
          filename: basename(image.path));
      formData.files.add(MapEntry("profile_image", multipartFile));
    } else {
      formData.fields.add(MapEntry("profile_image", ""));
    }

    var response = await dio.post(AppConstant.BaseUrl + url,
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
    String userName,
    File image,
    String name,
    String location,
    String city,
    String state,
    String pincode,
    bool imageEdited,
    String oldImage,
  ) async {
    String url = "update_profile.php";

    print(userId);
    print(name);
    print(location);
    print(city);
    print(state);
    print(pincode);
    print(imageEdited);
    print(oldImage);

    var dio = new Dio();
    dio.interceptors.add(LogInterceptor());
    dio.options.connectTimeout = 5000;
    dio.options.receiveTimeout = 5000;
    var profileImage;

    if (image != null) {
      profileImage = await MultipartFile.fromFile(image.path,
          filename: '$userName${extension(image.path)}');
      print('$userName${extension(image.path)}');
    } else {
      profileImage = "";
    }

    FormData formData = FormData.fromMap({
      "uid": userId,
      "name": name,
      "location": location,
      "city": city,
      "state": state,
      "pincode": pincode,
      "imageEdited": imageEdited,
      "oldimage": oldImage,
      'profile_image': image != null
          ? await MultipartFile.fromFile(image.path,
              filename: '$userName${extension(image.path)}')
          : "",
    });

    var response = await dio.post(
      AppConstant.BaseUrl + url,
      data: formData,
      options: Options(
        method: 'POST',
        responseType: ResponseType.json,
        headers: {
          "content-type": "multipart/form-data; boundary= ${formData.boundary}"
        },
      ),
    );
    print(response);
    if (response.statusCode == 200) {
      return response.data;
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

    var response = await client.post(AppConstant.BaseUrl + url, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> editUser(Map<String, String> body) async {
    String url = "update_profile.php";
    var response = await client.post(AppConstant.BaseUrl + url, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Pincodes> fetchPincodes() async {
    String url = "get_pincodes.php";

    var response = await client.get(AppConstant.BaseUrl + url);

    if (response.statusCode == 200) {
      return pincodesFromJson(response.body);
    }
    return null;
  }

  static Future<Categories> fetchCategories() async {
    String url = "get_all_categories.php";

    var response = await client.get(AppConstant.BaseUrl + url);

    if (response.statusCode == 200) {
      return categoriesFromJson(response.body);
    }
    return null;
  }

  static Future<Products> fetchProducts() async {
    String url = "get_all_products.php";

    var response = await client.get(AppConstant.BaseUrl + url);

    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    return null;
  }

  static Future<Products> fetchProductsByCatId(String catId) async {
    String url = "get_products_by_categoryId.php";
    Map<String, String> body = {"cid": catId};

    var response = await client.post(AppConstant.BaseUrl + url, body: body);

    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    return null;
  }

  static Future<Cart> fetchCart(String userId) async {
    String url = "get_current_cart_uid.php";
    Map<String, String> body = {"uid": userId};

    var response = await client.post(AppConstant.BaseUrl + url, body: body);
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

    var response = await client.post(AppConstant.BaseUrl + url, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> removeFromCart(String cartId) async {
    String url = "delete_cart_item.php";
    Map<String, String> body = {"cart_id": cartId};

    var response = await client.post(AppConstant.BaseUrl + url, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> updateCart(
      String cartId, String quantity) async {
    String url = "update_cart_items.php";
    Map<String, String> body = {"cart_id": cartId, "items": quantity};

    var response = await client.post(AppConstant.BaseUrl + url, body: body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<MyOrders> fetchOrders(String userId) async {
    String url = "get_orders_uid.php";
    Map<String, String> body = {"uid": userId};

    var response = await client.post(AppConstant.BaseUrl + url, body: body);
    if (response.statusCode == 200) {
      return myOrdersFromJson(response.body);
    }
    return null;
  }

  static Future<Cart> fetchOrderItems(String orderId) async {
    String url = "get_cart_order_id.php";
    Map<String, String> body = {"oid": orderId};

    var response = await client.post(AppConstant.BaseUrl + url, body: body);
    if (response.statusCode == 200) {
      return cartFromJson(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> initializeRazorpayOrder(
      Map<String, String> body) async {
    String url = "initialize_razorpay_order.php";

    var response = await client.post(AppConstant.BaseUrl + url, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static dynamic addRazorpayOrder(Map<String, dynamic> body) async {
    String url = "add_razorpay_order.php";

    var response = await client.post(AppConstant.BaseUrl + url, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<Map<String, dynamic>> placeOrder(
      Map<String, String> body) async {
    String url = "add_order.php";

    var response = await client.post(AppConstant.BaseUrl + url, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    return null;
  }

  static Future<MyOrderItems> fetchOrderDetails(String orderId) async {
    String url = "get_cart_order_id.php";
    Map<String, String> body = {"oid": orderId};

    var response = await client.post(AppConstant.BaseUrl + url, body: body);
    if (response.statusCode == 200) {
      return myOrderItemsFromJson(response.body);
    }
    return null;
  }
}
