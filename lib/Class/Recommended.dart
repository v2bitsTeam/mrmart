import 'package:flutter/material.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

class Recommended {
  String image, name;

  Recommended({
    this.image,
    this.name,
  });

  static List<Recommended> recommendeds = [
    Recommended(
      image: 'assets/demo/recomended0.png',
      name: 'Ripe Pomegranates',
    ),
    Recommended(image: 'assets/demo/recomended1.png', name: 'Ripe Papaye'),
    Recommended(image: 'assets/demo/recomended2.png', name: 'Green Apple'),
    Recommended(image: 'assets/demo/recomended3.png', name: 'Green Apple Face'),
    Recommended(image: 'assets/demo/recomended4.png', name: 'Microfiber Hand'),
    Recommended(image: 'assets/demo/recomended5.png', name: 'Organic Oil'),
  ];
}
