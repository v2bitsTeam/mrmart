import 'package:flutter/material.dart';
import 'package:mr_mart/Class/Recommended.dart';
import 'package:mr_mart/Class/TodayDeal.dart';
import 'package:mr_mart/Class/TrendingShop.dart';

class HomePageProvider with ChangeNotifier {
  bool loading = true;
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
