import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/Class/Recommended.dart';
import 'package:MrMart/Class/TodayDeal.dart';
import 'package:MrMart/Class/TrendingShop.dart';

class HomePageProvider with ChangeNotifier {
  bool Loading = true;
  List<TodayDeal> todayDeal = TodayDeal.todaydeals;
  List<Recommended> recommended = Recommended.recommendeds;
  List<TrendingShop> trendingShop = TrendingShop.trendingShops;
  List<TrendingShop> allShop = TrendingShop.allShop;

  List category = ['All', 'Grocery', 'Fruit', 'Vegetables', 'Soap'];

  @override
  void dispose() {
    super.dispose();
  }
}
