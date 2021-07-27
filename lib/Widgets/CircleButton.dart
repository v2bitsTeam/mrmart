import 'package:mr_mart/app_components/ThemesColor.dart';
import 'package:flutter/material.dart';

Widget circleButton({
  @required Function onTap,
  @required Widget child,
  bool loading = false,
  Color loadingColor,
  Color color,
}) {
  return GestureDetector(
    onTap: loading ? null : onTap,
    child: Container(
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: loading
          ? SizedBox(
              width: 25,
              height: 25,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    loadingColor == null ? Themes.primary : loadingColor,
                  ),
                ),
              ),
            )
          : child,
    ),
  );
}
