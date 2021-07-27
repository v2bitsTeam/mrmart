import 'package:flutter/cupertino.dart';
import 'package:mr_mart/Packege/FlushBar/flushbar.dart';
import 'package:mr_mart/Packege/FlushBar/flushbar_helper.dart';
import 'package:mr_mart/main.dart';

void infoMessage(BuildContext context, {String message = ''}) {
  FlushbarHelper.createInformation(
    message: message,
    position: FlushbarPosition.BOTTOM,
  )..show(context);
}

void successMessage(BuildContext context, {String message = ''}) {
  FlushbarHelper.createSuccess(
    message: message,
    position: FlushbarPosition.BOTTOM,
  )..show(context);
}

void errorMessage(BuildContext context, {var message = ''}) {
  FlushbarHelper.createError(
    message:
        message.runtimeType == String ? message : language.somethingWentWrong,
    position: FlushbarPosition.BOTTOM,
  )..show(context);
}
