import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

import '../main.dart';

Widget defaultTextField2({
  @required TextEditingController controller,
  FocusNode focusNode,
  String label,
  Color backgroundColor,
  IconData prefixIcon,
  Widget suffixIcon,
  int maxLine = 1,
  TextInputType textInputType = TextInputType.text,
  bool obscureText = false,
  String hint,
  bool enable = true,
  Function onTap,
  bool isRequired = false,
  bool borderEnable = true,
  double borderRadius,
}) {
  return GestureDetector(
    onTap: onTap,
    child: AbsorbPointer(
      absorbing: onTap != null,
      child: TextFormField(
        style: TextStyle(
            color: Themes.textColor,
            fontSize: Dimension.textSize,
            fontWeight: Dimension.textNormal),
        controller: controller,
        focusNode: focusNode,
        autocorrect: false,
        keyboardType: textInputType,
        cursorColor: Themes.primary,
        maxLines: maxLine,
        enabled: enable,
        obscureText: obscureText,
        textInputAction: TextInputAction.done,
        validator: (String value) {
          if (value.isEmpty) {
            if (focusNode != null) focusNode.requestFocus();
            return label != null
                ? '$label${language.required}'
                : language.required
                    .replaceAll(language.required.split(' ')[1], '');
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: label != null ? Dimension.padding : 5,
              bottom: label != null ? Dimension.padding : 5),
          fillColor:
              enable ? backgroundColor ?? Themes.white : Colors.transparent,
          enabledBorder: borderEnable
              ? textFieldBorder(borderRadius: borderRadius ?? Dimension.padding)
              : InputBorder.none,
          focusedBorder: borderEnable
              ? textFieldBorder(borderRadius: borderRadius ?? Dimension.padding)
              : InputBorder.none,
          errorBorder: borderEnable
              ? textFieldBorder(
                  isError: true,
                  borderRadius: borderRadius ?? Dimension.padding)
              : InputBorder.none,
          border: borderEnable
              ? textFieldBorder(borderRadius: borderRadius ?? Dimension.padding)
              : InputBorder.none,
          labelText: label != null ? '$label${isRequired ? '*' : ''}' : null,
          labelStyle: TextStyle(
              color: Themes.textColor,
              fontSize: Dimension.textSize,
              fontWeight: Dimension.textNormal),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Themes.primary,
                )
              : null,
          errorStyle: TextStyle(
            fontSize: Dimension.textSizeSmallExtra,
            color: Themes.red,
          ),
          suffixIcon: suffixIcon != null ? suffixIcon : null,
          hintText: hint,
          hintStyle: TextStyle(
            color: Themes.grey,
            fontSize: Dimension.textSize,
            fontWeight: Dimension.textNormal,
          ),
        ),
      ),
    ),
  );
}

textFieldBorder({bool isError = false, double borderRadius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(
      width: 1,
      color: isError ? Themes.red : Themes.primary,
    ),
  );
}
