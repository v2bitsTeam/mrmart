import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/main.dart';

enum ServerDateTime { Date, Time }

class Helper {
  static bool newProduct;
/*
  static String getDateTime(String datetime,
      {ServerDateTime serverDateTime = ServerDateTime.Date,
      bool withYear = true}) {
    List<String> data = datetime.split("T");
    if (serverDateTime == ServerDateTime.Date) {
      List date = data[0].split("-");
      return '${convertNumber(date[2])} ${language.Months[int.parse(date[1]) - 1]}${withYear ? ' ${convertNumber(date[0])}' : ''}';
    } else {
      List time = data[1].split('.')[0].split(":");
      int hour = int.parse(time[0]);
      bool isPm = hour > 12;
      return '${isPm ? hour - 12 : hour}:${time[1]} ${isPm ? 'PM' : "AM"}';
    }
  }*/

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

/*   static goBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static makeCall(String number) async {
    print(number);
    if (await canLaunch('tel:$number')) {
      await launch('tel:$number');
    } else {
      throw 'Could not launch $number';
    }
  } */
/*
  static String convertNumber(String eng) {
    String mainText = '';
    List<String> numbers = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
    if (isEnglish) {
      mainText = eng;
    } else {
      for (int i = 0; i < eng.length; i++) {
        try {
          mainText = mainText + numbers[int.parse(eng[i])];
        } catch (e) {
          mainText = mainText + eng[i];
        }
      }
    }
    return mainText;
  }*/

  static String calculateDiscountedPrice(double price, int discount) {
    if (discount > 0) {
      return (price - ((price * discount) / 100)).toString();
    }
    return price.toString();
  }
}
