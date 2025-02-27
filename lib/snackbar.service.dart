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
        title: title,
        message: body,
        backgroundColor: color ?? Get.theme.primaryColor,
        mainButton: action,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        icon: Icon(
          icon ?? Icons.info_outlined,
          size: 40,
          color: textColor ?? Get.theme.secondaryHeaderColor,
        ),
        snackPosition: position,
        snackStyle: style,
        duration: Duration(seconds: duration));
  }

  static void error({
    String? title,
    IconData icon = Icons.error_outline_outlined,
    required String body,
  }) =>
      show(
        color: Colors.red[500],
        title: title ?? 'Incorrectly'.tr,
        body: body,
        icon: icon,
      );

  static void warning({
    String? title,
    IconData icon = Icons.question_mark_outlined,
    required String body,
  }) =>
      show(
        color: Colors.orange[500],
        title: title ?? 'Warning'.tr,
        body: body,
        icon: icon,
      );

  static void success({
    String? title,
    required String body,
    IconData icon = Icons.check,
  }) =>
      show(
        color: Get.theme.primaryColor,
        title: title ?? 'Correctly'.tr,
        body: body,
        icon: icon,
      );

  static void deleted({
    required String body,
  }) =>
      success(
        title: 'Deleted'.tr,
        body: body,
        icon: Icons.delete_outline_rounded,
      );

  static void updated({
    required String body,
  }) =>
      success(
        title: 'Updated'.tr,
        body: body,
        icon: Icons.edit_note_rounded,
      );

  static void added({
    required String body,
  }) =>
      success(
        title: 'Added'.tr,
        body: body,
        icon: Icons.add,
      );
}
