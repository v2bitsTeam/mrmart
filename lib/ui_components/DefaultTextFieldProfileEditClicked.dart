import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/Dimension.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

import '../main.dart';

Widget defaultTextFieldProfileEditClicked({
  @required TextEditingController controller,
  FocusNode focusNode,
  String label,
  Color backgroundColor,
  var prefixIcon,
  Widget suffixIcon,
  int maxLine = 1,
  TextInputType textInputType = TextInputType.text,
  bool obscureText = false,
  String hint,
  bool enable = true,
  Function onTap,
  bool isRequired = false,
  bool borderEnable = true,
  TextInputAction textInputAction = TextInputAction.done,
  Function(String) onChanged,
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
        textInputAction: textInputAction,
        onChanged: onChanged,
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
          fillColor:
              enable ? backgroundColor ?? Themes.white : Colors.transparent,
          enabledBorder: borderEnable ? textFieldBorder() : InputBorder.none,
          focusedBorder: borderEnable ? textFieldBorder() : InputBorder.none,
          errorBorder:
              borderEnable ? textFieldBorder(isError: true) : InputBorder.none,
          border: borderEnable ? textFieldBorder() : InputBorder.none,
          labelText: label != null ? '$label${isRequired ? '*' : ''}' : 'Text',
          labelStyle: TextStyle(
            color: Themes.textColor,
            fontSize: Dimension.textSize,
            fontWeight: Dimension.textNormal,
          ),
          prefixIcon: prefixIcon != null
              ? prefixIcon.runtimeType == IconData
                  ? Icon(
                      prefixIcon,
                      color: Themes.primary,
                    )
                  : prefixIcon
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

textFieldBorder({bool isError = false}) {
  return UnderlineInputBorder(
    borderSide: BorderSide(
      width: 1,
      color: isError ? Themes.red : Themes.clearEdit,
    ),
  );
}
