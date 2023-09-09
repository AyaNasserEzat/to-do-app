import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/core/utiles/app_color.dart';

void showToast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: AppColor.withe,
      fontSize: 16.0);
}

enum ToastStates { error, success, warining }

Color getState(ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return AppColor.red;
    case ToastStates.success:
      return AppColor.primary;
    case ToastStates.warining:
      return AppColor.orange;
  }
}
