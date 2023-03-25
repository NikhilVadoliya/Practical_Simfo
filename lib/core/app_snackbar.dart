import 'package:simform_practical/core/app_string.dart';
import 'package:flutter/material.dart';

enum SnackBarType { normal, error, success }

class AppSnackBar {
  AppSnackBar._();

  static SnackBar snackBarNoInternetConnection() => _snackBar(AppString.noInternetConnection);

  static SnackBar normalSnackBar(String message) => _snackBar(message);

  static SnackBar _snackBar(String message, {SnackBarType snackBarType = SnackBarType.normal}) {
    return SnackBar(
      content: Text(message),
      dismissDirection: DismissDirection.none,
      backgroundColor: snackBarType == SnackBarType.success
          ? Colors.green
          : snackBarType == SnackBarType.error
              ? Colors.red
              : null,
      duration: const Duration(seconds: 5),
    );
  }
}
