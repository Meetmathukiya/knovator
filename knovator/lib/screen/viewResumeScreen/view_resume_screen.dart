import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovator/controller/addResumeController/add_resume_controller.dart';
import 'package:knovator/widget/appbar.dart';
import 'package:knovator/widget/text_widget.dart';

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
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(text: "Name", textSize: 14),
                              SizedBox(height: 4),
                              TextWidget(
                                  text: addResumeController
                                      .resumeList[widget.index]
                                      .nameController
                                      .text,
                                  fontWeight: FontWeight.w500,
                                  textSize: 16),
                            ],
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(text: "Phone", textSize: 14),
                              SizedBox(height: 4),
                              TextWidget(
                                  text: addResumeController
                                      .resumeList[widget.index]
                                      .phoneController
                                      .text,
                                  fontWeight: FontWeight.w500,
                                  textSize: 16),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      TextWidget(text: "Email", textSize: 14),
                      SizedBox(height: 4),
                      TextWidget(
                          text: addResumeController
                              .resumeList[widget.index].emailController.text,
                          fontWeight: FontWeight.w500,
                          textSize: 16),
                      SizedBox(height: 8),
                      if (addResumeController.resumeList[widget.index]
                          .addressController.text.isNotEmpty)
                        TextWidget(text: "Address", textSize: 14),
                      if (addResumeController.resumeList[widget.index]
                          .addressController.text.isNotEmpty)
                        SizedBox(height: 4),
                      TextWidget(
                          text: addResumeController
                              .resumeList[widget.index].addressController.text,
                          fontWeight: FontWeight.w500,
                          textSize: 16),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Description", textSize: 14),
                      SizedBox(height: 4),
                      TextWidget(
                          text: addResumeController
                              .resumeList[widget.index].summaryController.text,
                          fontWeight: FontWeight.w500,
                          textSize: 16),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(text: "Education", textSize: 14),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: addResumeController
                          .resumeList[widget.index].educationDetailsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 2),
                          title: TextWidget(
                              text: addResumeController.resumeList[widget.index]
                                  .educationDetailsList[index].schoolName.text,
                              fontWeight: FontWeight.w500,
                              textSize: 16),
                          subtitle: TextWidget(
                              text: addResumeController
                                  .resumeList[widget.index]
                                  .educationDetailsList[index]
                                  .graduationDate
                                  .text,
                              fontWeight: FontWeight.w500,
                              textSize: 16),
                          trailing: TextWidget(
                              text:
                                  "${addResumeController.resumeList[widget.index].educationDetailsList[index].percent.text} %",
                              fontWeight: FontWeight.w500,
                              textSize: 16),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            if (addResumeController
                .resumeList[widget.index].workExperinceList.isNotEmpty)
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Work Experience", textSize: 14),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: addResumeController
                            .resumeList[widget.index].workExperinceList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 2),
                            title: TextWidget(
                                text: addResumeController
                                    .resumeList[widget.index]
                                    .workExperinceList[index]
                                    .jobTitleController
                                    .text,
                                fontWeight: FontWeight.w500,
                                textSize: 16),
                            subtitle: TextWidget(
                                text: addResumeController
                                    .resumeList[widget.index]
                                    .workExperinceList[index]
                                    .comapnyNameController
                                    .text,
                                fontWeight: FontWeight.w500,
                                textSize: 16),
                            trailing: Column(
                              children: [
                                TextWidget(
                                    text: addResumeController
                                        .resumeList[widget.index]
                                        .workExperinceList[index]
                                        .dateOfJoinController
                                        .text,
                                    fontWeight: FontWeight.w500,
                                    textSize: 16),
                                TextWidget(
                                    text: addResumeController
                                        .resumeList[widget.index]
                                        .workExperinceList[index]
                                        .dateOfResignController
                                        .text,
                                    fontWeight: FontWeight.w500,
                                    textSize: 16),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            if (addResumeController
                .resumeList[widget.index].skillDetailsList.isNotEmpty)
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Skill", textSize: 14),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: addResumeController
                            .resumeList[widget.index].skillDetailsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 2),
                            title: TextWidget(
                                text: addResumeController
                                    .resumeList[widget.index]
                                    .skillDetailsList[index]
                                    .skillName
                                    .text,
                                fontWeight: FontWeight.w500,
                                textSize: 16),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            if (addResumeController
                .resumeList[widget.index].languageDetailsList.isNotEmpty)
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Language", textSize: 14),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: addResumeController.resumeList[widget.index]
                            .languageDetailsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(vertical: 2),
                            title: TextWidget(
                                text: addResumeController
                                    .resumeList[widget.index]
                                    .languageDetailsList[index]
                                    .language
                                    .text,
                                fontWeight: FontWeight.w500,
                                textSize: 16),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
