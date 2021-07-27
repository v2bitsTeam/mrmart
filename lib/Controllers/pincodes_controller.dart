import 'package:mr_mart/Models/pincodes.dart';
import 'package:mr_mart/Services/http_services.dart';
import 'package:get/get.dart';

class PincodesController extends GetxController {
  final pincodes = [].obs;
  final userPincodeData = PincodeData().obs;

  @override
  void onInit() {
    super.onInit();
    fetchPincodes();
  }

  void fetchPincodes() async {
    var response = await HTTPServices.fetchPincodes();

    if (response.status) {
      pincodes.assignAll(response.data);
    } else {
      pincodes.assignAll([]);
    }
  }

  void updateUserPincode(pincodeData) async {}
}
