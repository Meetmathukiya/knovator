import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:knovator/controller/addResumeController/add_resume_controller.dart';
import 'package:knovator/model/educationDetailsModel/edu_details_model.dart';
import 'package:knovator/model/workExperienceModel/work_exp_model.dart';
import 'package:knovator/utils/const/app_colors.dart';
import 'package:knovator/widget/appbar.dart';
import 'package:knovator/widget/text_edit_field.dart';
import 'package:knovator/widget/text_widget.dart';

import '../../utils/helper/helper.dart';
import '../../widget/date_picker.dart';

class AddResumeScreen extends StatefulWidget {
  const AddResumeScreen({super.key});

  @override
  State<AddResumeScreen> createState() => _AddResumeScreenState();
}

class _AddResumeScreenState extends State<AddResumeScreen> {
  AddResumeController addResumeController = Get.put(AddResumeController());
  @override
  void initState() {
    addResumeController.educationDetailsList.add(EducationDetails(
        schoolName: TextEditingController(),
        graduationDate: TextEditingController(),
        percent: TextEditingController()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey300,
      appBar: HelperAppBar.appbarHelper(title: "Add New Resume"),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Obx(
                () => Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TextWidget(
                              text: "Personal Details",
                              textSize: 16,
                            ),
                            const SizedBox(height: 8),
                            TextEditField.textField(
                                hintText: "Enter Name",
                                controller: addResumeController.nameController),
                            const SizedBox(height: 8),
                            TextEditField.textField(
                                hintText: "Enter Phone",
                                textInputType: TextInputType.phone,
                                controller:
                                    addResumeController.phoneController),
                            const SizedBox(height: 8),
                            TextEditField.textField(
                                hintText: "Enter Email",
                                textInputType: TextInputType.emailAddress,
                                controller:
                                    addResumeController.emailController),
                            const SizedBox(height: 8),
                            TextEditField.textField(
                                hintText: "Enter Address",
                                textInputType: TextInputType.emailAddress,
                                controller:
                                    addResumeController.addressController),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TextWidget(
                              text: "Summary",
                              textSize: 16,
                            ),
                            const SizedBox(height: 8),
                            TextEditField.textField(
                                hintText: "Write About Yourself/Summary",
                                maxLine: 3,
                                controller:
                                    addResumeController.summaryController),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextWidget(
                                  text: "Educational Details",
                                  textSize: 16,
                                ),
                                InkWell(
                                    onTap: () {
                                      addResumeController.educationDetailsList
                                          .add(EducationDetails(
                                              schoolName:
                                                  TextEditingController(),
                                              graduationDate:
                                                  TextEditingController(),
                                              percent:
                                                  TextEditingController()));
                                      setState(() {});
                                    },
                                    child: Icon(Icons.add_circle_outline))
                              ],
                            ),
                            const SizedBox(height: 8),
                            ListView.separated(
                              itemCount: addResumeController
                                  .educationDetailsList.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                            text: "${index + 1}", textSize: 15),
                                        if (index > 0)
                                          InkWell(
                                              onTap: () {
                                                addResumeController
                                                    .educationDetailsList
                                                    .removeAt(index);
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                color: AppColors.redColors,
                                                size: 22,
                                              ))
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    TextEditField.textField(
                                        hintText:
                                            "Enter School/University Name",
                                        controller: addResumeController
                                            .educationDetailsList[index]
                                            .schoolName),
                                    const SizedBox(height: 8),
                                    TextEditField.textField(
                                        hintText: "Enter Graduation Date",
                                        readOnly: true,
                                        ontap: () {
                                          datePickerEdu(index);
                                        },
                                        controller: addResumeController
                                            .educationDetailsList[index]
                                            .graduationDate),
                                    const SizedBox(height: 8),
                                    TextEditField.textField(
                                        hintText: "Enter Percentage",
                                        textInputType:
                                            TextInputType.streetAddress,
                                        controller: addResumeController
                                            .educationDetailsList[index]
                                            .percent),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextWidget(text: "I'm Fresher", textSize: 16),
                        SizedBox(width: 8),
                        Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.standard,
                            value: addResumeController.isFresher.value,
                            checkColor: AppColors.white,
                            activeColor: AppColors.primaryColor,
                            onChanged: (val) {
                              addResumeController.isFresher.value = val!;
                            }),
                      ],
                    ),
                    if (!addResumeController.isFresher.value)
                      Card(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const TextWidget(
                                        text: "Work Experience",
                                        textSize: 16,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            addResumeController
                                                .workExperinceList
                                                .add(WorkExpDetails(
                                                    jobTitleController:
                                                        TextEditingController(),
                                                    comapnyNameController:
                                                        TextEditingController(),
                                                    dateOfJoinController:
                                                        TextEditingController(),
                                                    isCurrentlyWorking: false,
                                                    dateOfResignController:
                                                        TextEditingController()));
                                            setState(() {});
                                          },
                                          child: Icon(Icons.add_circle_outline))
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  ListView.separated(
                                    itemCount: addResumeController
                                        .workExperinceList.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextWidget(
                                                  text: "${index + 1}",
                                                  textSize: 15),
                                              if (index > 0)
                                                InkWell(
                                                    onTap: () {
                                                      addResumeController
                                                          .workExperinceList
                                                          .removeAt(index);
                                                      setState(() {});
                                                    },
                                                    child: const Icon(
                                                      Icons.close,
                                                      color:
                                                          AppColors.redColors,
                                                      size: 22,
                                                    ))
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          TextEditField.textField(
                                              hintText: "Enter Job Title",
                                              controller: addResumeController
                                                  .workExperinceList[index]
                                                  .jobTitleController),
                                          const SizedBox(height: 8),
                                          TextEditField.textField(
                                              hintText: "Enter Company Name",
                                              controller: addResumeController
                                                  .workExperinceList[index]
                                                  .comapnyNameController),
                                          Row(
                                            children: [
                                              TextWidget(
                                                  text:
                                                      "Currently Working Here",
                                                  textSize: 16),
                                              SizedBox(width: 8),
                                              Checkbox(
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .shrinkWrap,
                                                  visualDensity:
                                                      VisualDensity.standard,
                                                  value: addResumeController
                                                      .workExperinceList[index]
                                                      .isCurrentlyWorking,
                                                  checkColor: AppColors.white,
                                                  activeColor:
                                                      AppColors.primaryColor,
                                                  onChanged: (val) {
                                                    addResumeController
                                                            .workExperinceList[
                                                                index]
                                                            .isCurrentlyWorking =
                                                        val!;
                                                    setState(() {});
                                                  }),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: TextEditField.textField(
                                                    hintText: "Date Of Joining",
                                                    readOnly: true,
                                                    ontap: () {
                                                      selectJoiningDate(index);
                                                    },
                                                    controller: addResumeController
                                                        .workExperinceList[
                                                            index]
                                                        .dateOfJoinController),
                                              ),
                                              if (!addResumeController
                                                  .workExperinceList[index]
                                                  .isCurrentlyWorking)
                                                const SizedBox(width: 8),
                                              if (!addResumeController
                                                  .workExperinceList[index]
                                                  .isCurrentlyWorking)
                                                Expanded(
                                                  child:
                                                      TextEditField.textField(
                                                          hintText:
                                                              "Date Of Resign",
                                                          readOnly: true,
                                                          ontap: () {
                                                            selectResignDate(
                                                                index);
                                                          },
                                                          controller: addResumeController
                                                              .workExperinceList[
                                                                  index]
                                                              .dateOfResignController),
                                                ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ])),
                      ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  datePickerEdu(int index) async {
    DateTime? date = await selectDate(
      context,
    );
    if (date != null) {
      addResumeController.educationDetailsList[index].graduationDate.text =
          formatDate(date: date);
    }
  }

  selectJoiningDate(int index) async {
    DateTime? date = await selectDate(
      context,
    );
    if (date != null) {
      addResumeController.workExperinceList[index].dateOfJoinController.text =
          formatDate(date: date);
    }
  }

  selectResignDate(int index) async {
    DateTime? date = await selectDate(
      context,
    );
    if (date != null) {
      addResumeController.workExperinceList[index].dateOfResignController.text =
          formatDate(date: date);
    }
  }
}
