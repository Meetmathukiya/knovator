import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/const/app_colors.dart';

class TextEditField {
  static TextFormField textField(
      {required String hintText,
      String? valText,
      int? maxLine,
      bool? readOnly,
      Function()? ontap,
      required TextEditingController controller,
      TextInputType? textInputType}) {
    return TextFormField(
      readOnly: readOnly ?? false,
      maxLines: maxLine ?? 1,
      onTap: ontap,
      maxLength: textInputType == TextInputType.phone ? 10 : null,
      controller: controller,
      style: const TextStyle(color: AppColors.black),
      cursorColor: AppColors.black,
      cursorWidth: 1.5,
      decoration: InputDecoration(
          counterText: '',
          alignLabelWithHint: true,
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: AppColors.black40),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: AppColors.black40),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(color: AppColors.black40),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          hintText: hintText.tr,
          hintStyle: TextStyle(color: AppColors.black65, fontSize: 14)),
      keyboardType: textInputType,
      validator: (value) {
        if (value == '') {
          if (valText != null) {
            return valText.tr;
          }
        }
        return null;
      },
    );
  }
}
