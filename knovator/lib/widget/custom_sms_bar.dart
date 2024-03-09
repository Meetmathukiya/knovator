// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:knovator/utils/const/app_colors.dart';
import 'package:knovator/widget/text_widget.dart';

class CustomSmsBar extends StatefulWidget {
  final String title;
  final String message;

  // ignore: use_key_in_widget_constructors
  const CustomSmsBar.success({
    Key? key,
    required this.title,
    required this.message,
  });

  @override
  _CustomSmsBarState createState() => _CustomSmsBarState();
}

class _CustomSmsBarState extends State<CustomSmsBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 8.0),
            spreadRadius: 1,
            blurRadius: 30,
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: widget.title,
            color: AppColors.black,
            textSize: 16,
          ),
          const SizedBox(
            height: 6,
          ),
          TextWidget(text: widget.message, textSize: 14)
        ],
      ),
    );
  }
}
