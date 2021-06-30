import 'dart:io';

import 'package:MrMart/Models/user.dart';
import 'package:MrMart/Route/Route.dart';
import 'package:MrMart/Services/http_services.dart';
import 'package:MrMart/Services/shared_prefs_services.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final user = UserDetails().obs;
  final userSignedUp = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> fetchUser(String mobile, String password) async {
    var response = await HTTPServices.fetchUser(mobile, password);
    if (response.status) {
      user(response.data[0]);
      SharedPrefServices.saveUsertoSharedPrefs(mobile, password);
      return true;
    }
    return false;
  }

  void getUserFromCache() async {
    var localUser = await SharedPrefServices.getUserFromSharedPrefs();
    if (localUser['mobile'] != null) {
      var userLogin =
          await fetchUser(localUser['mobile'], localUser['password']);
      if (userLogin) {
        Get.toNamed(GET_USER_LOCATION_SCREEN);
      } else {
        Get.toNamed(AUTHENTICATION);
      }
    } else {
      Get.toNamed(AUTHENTICATION);
    }
  }

  Future<bool> createUser(
    image,
    String name,
    String mobile,
    String password,
    String location,
    String city,
    String state,
    String pincode,
  ) async {
    var response = await HTTPServices.createUser(
      image,
      name,
      mobile,
      password,
      location,
      city,
      state,
      pincode,
    );

    print(response);
    if (response['status']) {
      return true;
    }
    return false;
  }

  Future<bool> updateUser(
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
    var response = await HTTPServices.updateUser(
      userId,
      userName,
      image,
      name,
      location,
      city,
      state,
      pincode,
      imageEdited,
      oldImage,
    );

    if (response['status']) {
      return true;
    }
    return false;
  }

  Future<bool> editUserDetails(Map<String, String> body) async {
    var response = await HTTPServices.editUser(body);
    if (response['status']) {
      return true;
    }
    return false;
  }

  Future<bool> changeUserPassword(
      String newPassword, String oldPassword, String userId) async {
    var response =
        await HTTPServices.updatePassword(newPassword, oldPassword, userId);
    if (response['status']) {
      return true;
    }
    return false;
  }

  void signOutUser() async {
    user.update((user) {
      user.id = null;
      user.uid = null;
      user.role = null;
      user.name = null;
      user.mobile = null;
      user.password = null;
      user.profileImage = null;
      user.location = null;
      user.city = null;
      user.state = null;
      user.pincode = null;
      user.registeredShopId = null;
      user.gstNumber = null;
      user.createdOn = DateTime(2021);
      user.modifiedOn = DateTime(2021);
    });
    SharedPrefServices.clearUserFromSharedPrefs();
    Get.toNamed(AUTHENTICATION);
  }
}
