import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void show({
    String? body,
    String? title,
    IconData? icon,
    Color? color,
    TextButton? action,
    int duration = 4,
    SnackPosition position = SnackPosition.TOP,
    SnackStyle style = SnackStyle.GROUNDED,
  }) {
    // close if exist
    Get.closeAllSnackbars();

    // Show
    Get.rawSnackbar(
        title: title,
        message: body,
        backgroundColor: color ?? Get.theme.primaryColor,
        mainButton: action,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        icon: icon != null
            ? Icon(
                icon,
                color: Get.theme.colorScheme.secondary,
              )
            : null,
        snackPosition: position,
        snackStyle: style,
        duration: Duration(seconds: duration));
  }
}
