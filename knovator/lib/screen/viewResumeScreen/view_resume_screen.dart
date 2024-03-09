import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovator/controller/addResumeController/add_resume_controller.dart';
import 'package:knovator/widget/appbar.dart';

class ViewResumeScreen extends StatefulWidget {
  int index;
  ViewResumeScreen({super.key, required this.index});

  @override
  State<ViewResumeScreen> createState() => _ViewResumeScreenState();
}

class _ViewResumeScreenState extends State<ViewResumeScreen> {
  AddResumeController addResumeController = Get.put(AddResumeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperAppBar.appbarHelper(
          title:
              addResumeController.resumeList[widget.index].nameController.text),

              
    );
  }
}
