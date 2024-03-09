
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../widget/custom_sms_bar.dart';
  
   String formatDate({required date, String? formateCode}) {
   
    return DateFormat(formateCode ?? "dd-MM-yyy")
        .format(DateTime.parse(date.toString()));
  }
   displayMessageBar(BuildContext context, String title, String msg) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSmsBar.success(
        title: title,
        message: msg,
      ),
      padding: EdgeInsets.symmetric(horizontal: Get.width / 4),
    );
  }