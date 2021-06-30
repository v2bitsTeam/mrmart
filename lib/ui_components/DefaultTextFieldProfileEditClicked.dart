import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:MrMart/app_components/Dimension.dart';
import 'package:MrMart/app_components/ThemesColor.dart';

import '../main.dart';

Widget DefaultTextFieldProfileEditClicked(
    {@required TextEditingController controller,
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
    Function(String) onChanged}) {
  return GestureDetector(
    onTap: onTap,
    child: AbsorbPointer(
      absorbing: onTap != null,
      child: TextFormField(
        style: TextStyle(
            color: Themes.Text_Color,
            fontSize: Dimension.Text_Size,
            fontWeight: Dimension.textNormal),
        controller: controller,
        focusNode: focusNode,
        autocorrect: false,
        keyboardType: textInputType,
        cursorColor: Themes.Primary,
        maxLines: maxLine,
        enabled: enable,
        obscureText: obscureText,
        textInputAction: textInputAction,
        onChanged: onChanged,
        validator: (String value) {
          if (value.isEmpty) {
            if (focusNode != null) focusNode.requestFocus();
            return label != null
                ? '$label${language.Required}'
                : language.Required.replaceAll(
                    language.Required.split(' ')[1], '');
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            filled: true,
            /*contentPadding: EdgeInsets.only(
                left: 10,
                right: 10,
                top: label != null ? Dimension.Padding : 5,
                bottom: label != null ? Dimension.Padding : 5),*/
            fillColor:
                enable ? backgroundColor ?? Themes.White : Colors.transparent,
            enabledBorder: borderEnable ? textFieldBorder() : InputBorder.none,
            focusedBorder: borderEnable ? textFieldBorder() : InputBorder.none,
            errorBorder: borderEnable
                ? textFieldBorder(isError: true)
                : InputBorder.none,
            border: borderEnable ? textFieldBorder() : InputBorder.none,
            labelText:
                label != null ? '$label${isRequired ? '*' : ''}' : 'Text',
            labelStyle: TextStyle(
                color: Themes.Text_Color,
                fontSize: Dimension.Text_Size,
                fontWeight: Dimension.textNormal),
            prefixIcon: prefixIcon != null
                ? prefixIcon.runtimeType == IconData
                    ? Icon(
                        prefixIcon,
                        color: Themes.Primary,
                      )
                    : prefixIcon
                : null,
            errorStyle: TextStyle(
                fontSize: Dimension.Text_Size_Small_Extra, color: Themes.Red),
            suffixIcon: suffixIcon != null ? suffixIcon : null,
            hintText: hint,
            hintStyle: TextStyle(
                color: Themes.Grey,
                fontSize: Dimension.Text_Size,
                fontWeight: Dimension.textNormal)),
      ),
    ),
  );
}

textFieldBorder({bool isError = false}) {
  return UnderlineInputBorder(
    borderSide:
        BorderSide(width: 1, color: isError ? Themes.Red : Themes.Clear_Edit),
  );
}
