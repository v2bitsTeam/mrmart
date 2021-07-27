import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

Widget ratingView({
  double rating = 5,
  int itemCount = 5,
  double itemSize = 16,
  Color color,
  Color unratedColor,
  bool ignoreGestures = true,
  Function(double) onRatingUpdate,
}) {
  return RatingBar.builder(
    initialRating: rating,
    minRating: 0,
    direction: Axis.horizontal,
    allowHalfRating: false,
    ignoreGestures: ignoreGestures,
    itemCount: itemCount,
    unratedColor: unratedColor != null ? unratedColor : Colors.grey[200],
    itemSize: itemSize,
    itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
    itemBuilder: (context, _) => Icon(
      Icons.star,
      color: color == null ? Themes.ratingColor : color,
    ),
    onRatingUpdate: onRatingUpdate == null
        ? (rating) {
            print(rating);
          }
        : onRatingUpdate,
  );
}
