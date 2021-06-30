import 'package:flutter/material.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

class TodayDeal {
  String image, name;
  int price;
  Color color;

  TodayDeal({this.image, this.name, this.price, this.color});

  static List<TodayDeal> todaydeals = [
    TodayDeal(
        image: 'assets/demo/today-deal0.png',
        name: 'Shampoo',
        price: 100,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal1.png',
        name: 'Grocery',
        price: 110,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal2.png',
        name: 'Makeup',
        price: 120,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal3.png',
        name: 'Camera',
        price: 130,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal4.png',
        name: 'Technic Soft',
        price: 140,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal5.png',
        name: 'Health products',
        price: 150,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal6.png',
        name: 'Cosmetics',
        price: 160,
        color: Themes.randomColor()),
    TodayDeal(
        image: 'assets/demo/today-deal7.png',
        name: 'Cosmetics Beauty',
        price: 170,
        color: Themes.randomColor()),
  ];
}
