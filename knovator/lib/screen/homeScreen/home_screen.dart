import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovator/screen/addResumeScreen/add_resume_screen.dart';
import 'package:knovator/utils/const/app_colors.dart';
import 'package:knovator/widget/appbar.dart';
import 'package:knovator/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperAppBar.appbarHelper(title: "Resume", hideBack: true),
      body: const Center(
        child: TextWidget(text: "No data", textSize: 16),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddResumeScreen());
        },
        child: Icon(Icons.add,color: AppColors.white,),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
