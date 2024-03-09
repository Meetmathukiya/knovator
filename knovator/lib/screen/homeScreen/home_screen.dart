import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knovator/controller/addResumeController/add_resume_controller.dart';
import 'package:knovator/screen/addResumeScreen/add_resume_screen.dart';
import 'package:knovator/screen/viewResumeScreen/view_resume_screen.dart';
import 'package:knovator/utils/const/app_colors.dart';
import 'package:knovator/widget/appbar.dart';
import 'package:knovator/widget/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AddResumeController addResumeController = Get.put(AddResumeController());
  static var getStore = GetStorage();
  @override
  void initState() {
    if (getStore.read('resume') != null) {
      addResumeController.resumeList = jsonDecode(getStore.read('resume'));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperAppBar.appbarHelper(title: "Resume", hideBack: true),
      body: addResumeController.resumeList.isEmpty
          ? const Center(
              child: TextWidget(text: "No data", textSize: 16),
            )
          : ListView.separated(
              itemCount: addResumeController.resumeList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Get.to(() => ViewResumeScreen(index: index));
                  },
                  title: TextWidget(
                      text: addResumeController
                          .resumeList[index].nameController.text,
                      textSize: 16),
                  subtitle: TextWidget(
                      text: addResumeController
                          .resumeList[index].phoneController.text,
                      textSize: 16),
                  trailing: SizedBox(
                    width: 10,
                    child: PopupMenuButton(
                      icon: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        maxRadius: 15,
                        minRadius: 15,
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: 24,
                        ),
                      ),
                      padding: const EdgeInsets.all(0),
                      onSelected: (selected) {
                        switch (selected) {
                          case 0:
                            {
                              addResumeController.isEdit(true);
                              addResumeController.fillData(index);
                              addResumeController.selectedIndex = index;
                              Get.to(AddResumeScreen())!.whenComplete(() {
                                setState(() {});
                              });
                              break;
                            }
                          case 2:
                            {
                              Get.to(() => ViewResumeScreen(index: index));

                              break;
                            }
                          case 1:
                            {
                              addResumeController.resumeList.removeAt(index);
                              setState(() {});
                              break;
                            }
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          height: 50,
                          padding: EdgeInsets.all(0),
                          value: 2,
                          child: Center(
                            child: TextWidget(
                                text: "View",
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                                textSize: 14),
                          ),
                        ),
                        const PopupMenuItem(
                          height: 50,
                          padding: EdgeInsets.all(0),
                          value: 0,
                          child: Center(
                            child: TextWidget(
                                text: "Edit",
                                fontWeight: FontWeight.w700,
                                color: AppColors.black,
                                textSize: 14),
                          ),
                        ),
                        const PopupMenuItem(
                          height: 50,
                          padding: EdgeInsets.all(0),
                          value: 1,
                          child: Center(
                            child: TextWidget(
                                text: "Delete",
                                fontWeight: FontWeight.w700,
                                color: AppColors.redColors,
                                textSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addResumeController.isEdit(false);
          addResumeController.clearData();
          Get.to(() => const AddResumeScreen())!.whenComplete(() {
            setState(() {});
          });
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
