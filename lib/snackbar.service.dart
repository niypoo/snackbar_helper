import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static Future<void> show({
    String? title,
    required String body,
    IconData? icon,
    Color? color,
    Color? textColor,
    TextButton? action,
    int duration = 4,
    SnackPosition position = SnackPosition.TOP,
    SnackStyle style = SnackStyle.GROUNDED,
  }) async {
    // close if exist
    Get.closeAllSnackbars();

    // delayed
    await Future.delayed(const Duration(seconds: 1));

    // Show
    Get.rawSnackbar(
        message: body,
        backgroundColor: color ?? Get.theme.primaryColor,
        mainButton: action,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        titleText: Text(
          title ?? '',
          style: Get.textTheme.titleLarge!.copyWith(
            color: textColor ?? Get.theme.secondaryHeaderColor,
          ),
        ),
        messageText: Text(
          body ?? '',
          style: Get.textTheme.bodyLarge!.copyWith(
            color: textColor ?? Get.theme.secondaryHeaderColor,
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
    String? title,
    required String body,
  }) =>
      show(
        color: Colors.red[500],
        title: title ?? 'Incorrectly'.tr,
        body: body,
      );

  static void success({
    String? title,
    required String body,
  }) =>
      show(
        color: Colors.green[500],
        title: title ?? 'Correctly'.tr,
        body: body,
      );
}
