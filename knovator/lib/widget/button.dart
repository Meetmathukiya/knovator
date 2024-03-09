import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/const/app_colors.dart';
import 'text_widget.dart';

class AppButton {
  static primaryButton(
      {required void Function()? onButtonPressed,
      required String title,
      Widget? child,
      Color? color,
      Color? textColor,
      double? radius}) {
    return Container(
      width: Get.width,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.primaryColor,
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            minimumSize: const Size.fromHeight(45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 4),
            ),
            backgroundColor: color ?? AppColors.primaryColor,
          ),
          onPressed: onButtonPressed,
          child: child ??
              TextWidget(
                  text: title.tr,
                  textSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor ?? AppColors.white)),
    );
  }
}
