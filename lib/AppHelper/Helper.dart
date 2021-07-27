import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ServerDateTime { Date, Time }

class Helper {
  static bool newProduct;

  static Future<String> showDatePickerDialog(BuildContext context,
      {DateTime selectedDate}) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      return picked.toString().split(' ')[0];
    } else
      return null;
  }

  static String calculateDiscountedPrice(double price, int discount) {
    if (discount > 0) {
      return (price - ((price * discount) / 100)).toString();
    }
    return price.toString();
  }
}
