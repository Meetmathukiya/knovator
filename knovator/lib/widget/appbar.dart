import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovator/widget/text_widget.dart';

import '../utils/const/app_colors.dart';

class HelperAppBar {
  static appbarHelper({
    required String title,
    List<Widget>? action,
    Color? bgColor,
    bool? hideBack,
  }) {
    return PreferredSize(
        preferredSize: Size(0, 56),
        child: AppBar(
          backgroundColor: bgColor ?? AppColors.primaryColor,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.white),
          title: TextWidget(text: title,color: AppColors.white,fontWeight: FontWeight.w500, textSize: 16),
          centerTitle: true,
          actions: action,
          leading: hideBack == true
              ? null
              : IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 20,
                    color: AppColors.white,
                  ),
                ),
        ));
  }
}
