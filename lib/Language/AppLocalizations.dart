/*
import 'package:MrMart/URL/AppConstant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';
import 'BN.dart';
import 'EN.dart';

enum AppLocale { EN, BN }
List<Languages> get appLanguages => [
      Languages(name: 'বাংলা', locale: AppLocale.BN, key: 'bn'),
      Languages(name: 'English', locale: AppLocale.EN, key: 'en'),
    ];

class LocaleHelper {
  static getAllLocale() {
    return [
      Locale('en', 'US'),
      Locale('bn', ''),
    ];
  }

  static String getKey(AppLocale locale) {
    switch (locale) {
      case AppLocale.EN:
        return "en";
      case AppLocale.BN:
        return "bn";
      default:
        return AppConstant.Default_Language;
    }
  }

  static AppLocale getLocale(String key) {
    switch (key) {
      case "en":
        return AppLocale.EN;
      case "bn":
        return AppLocale.BN;
      default:
        return AppConstant.Default_Locale;
    }
  }

  static setLanguage(AppLocale locale) {
    switch (locale) {
      case AppLocale.EN:
        EN();
        return null;
      case AppLocale.BN:
        BN();
        return null;
      default:
        AppConstant.Default_Language_Function;
        return null;
    }
  }
}

class Languages {
  String name, key;
  AppLocale locale;
  Languages({this.name, this.locale, this.key});
}
*/
