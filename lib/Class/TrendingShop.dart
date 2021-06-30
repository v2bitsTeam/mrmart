import 'package:flutter/material.dart';
import 'package:MrMart/app_components/ThemesColor.dart';
import 'package:MrMart/app_components/constants.dart';

class TrendingShop {
  String image, name, details;
  int distance, totalRating;
  double rating;
  Color color;

  TrendingShop(
      {this.image,
      this.name,
      this.details,
      this.distance,
      this.totalRating,
      this.rating,
      this.color});

  static List<TrendingShop> trendingShops = [
    TrendingShop(
      image: 'assets/demo/trending-shop0.png',
      name: 'K & K Stationary',
      details: 'Aenan justo nulla ferme ntum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG1,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop1.png',
      name: 'Giant Food Stores.',
      details: 'Aenan justo nulla ferme ntum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG5,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop2.png',
      name: 'K & K Stationary',
      details: 'Aenan justo nulla ferme ntum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG2,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop3.png',
      name: 'K & K Stationary',
      details: 'Aenan justo nulla ferme ntum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG3,
    ),
    TrendingShop(
      image: 'assets/demo/trending-shop4.png',
      name: 'K & K Stationary',
      details: 'Aenan justo nulla ferme ntum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG4,
    ),
  ];
  static List<TrendingShop> allShop = [
    TrendingShop(
      image: 'assets/demo/shop0.png',
      name: 'Giant Food Stores.',
      details: 'Aenan justo nulla ferme ntum vitae',
      distance: 5,
      rating: 4.8,
      totalRating: 520,
      color: kFollowed_BG5,
    ),
    TrendingShop(
        image: 'assets/demo/shop1.png',
        name: 'K & K Stationary',
        details: 'Aenan justo nulla ferme ntum vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop2.png',
        name: 'Giant Food Stores.',
        details: 'Aenan justo nulla ferme ntum vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop3.png',
        name: 'K & K Stationary',
        details: 'Aenan justo nulla ferme ntum vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
    TrendingShop(
        image: 'assets/demo/shop4.png',
        name: 'K & K Stationary',
        details: 'Aenan justo nulla ferme ntum vitae',
        distance: 5,
        rating: 4.8,
        totalRating: 520,
        color: Themes.randomColor()),
  ];
}
