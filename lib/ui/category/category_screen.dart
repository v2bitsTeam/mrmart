import 'package:mr_mart/app_components/Dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/CategoryBody.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryBody((Get.height * 0.15) * 0.2 + Dimension.size34);
  }
}
