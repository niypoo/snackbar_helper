import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void show({
    required String title,
    String? body,
    IconData? icon,
    Color? color,
    Color? textColor,
    TextButton? action,
    int duration = 4,
    SnackPosition position = SnackPosition.TOP,
    SnackStyle style = SnackStyle.GROUNDED,
  }) {
    // close if exist
    Get.closeAllSnackbars();

    // Show
    Get.rawSnackbar(
        message: body,
        backgroundColor: color ?? Get.theme.primaryColor,
        mainButton: action,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        titleText: Text(
          title,
          style: Get.textTheme.titleLarge!.copyWith(
            color: textColor ?? Get.theme.secondaryHeaderColor,
          ),
        ),
        messageText: Text(
          body ?? '',
          style: Get.textTheme.bodyLarge!.copyWith(
          ),
        ),
        icon: icon != null
            ? Icon(
                icon,
                color: textColor ?? Get.theme.secondaryHeaderColor,
              )
            : null,
        snackPosition: position,
        snackStyle: style,
        duration: Duration(seconds: duration));
  }

  static void error({
    required String title,
    String? body,
  }) =>
      show(
        color: Colors.red[900],
        title: title,
        body: body,
      );

  static void success({
    required String title,
    String? body,
  }) =>
      show(
        color: Colors.green[900],
        title: title,
        body: body,
      );
}
