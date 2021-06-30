import 'package:flutter/cupertino.dart';
import 'package:MrMart/Packege/FlushBar/flushbar.dart';
import 'package:MrMart/Packege/FlushBar/flushbar_helper.dart';
import 'package:MrMart/main.dart';

void infoMessage(BuildContext context, {String message = ''}) {
  FlushbarHelper.createInformation(
      message: message, position: FlushbarPosition.BOTTOM)
    ..show(context);
}

void successMessage(BuildContext context, {String message = ''}) {
  FlushbarHelper.createSuccess(
      message: message, position: FlushbarPosition.BOTTOM)
    ..show(context);
}

void errorMessage(BuildContext context, {var message = ''}) {
  FlushbarHelper.createError(
      message: message.runtimeType == String
          ? message
          : language.Something_went_wrong,
      position: FlushbarPosition.BOTTOM)
    ..show(context);
}
