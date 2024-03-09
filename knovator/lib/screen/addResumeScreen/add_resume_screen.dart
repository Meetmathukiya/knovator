import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knovator/controller/addResumeController/add_resume_controller.dart';
import 'package:knovator/model/educationDetailsModel/edu_details_model.dart';
import 'package:knovator/model/languageModel/language_model.dart';
import 'package:knovator/model/resumeViewModel/resume_view_model.dart';
import 'package:knovator/model/workExperienceModel/work_exp_model.dart';
import 'package:knovator/screen/addResumeScreen/screenwidget/educationalDetails.dart';
import 'package:knovator/screen/addResumeScreen/screenwidget/work_exp.dart';
import 'package:knovator/utils/const/app_colors.dart';
import 'package:knovator/widget/appbar.dart';
import 'package:knovator/widget/button.dart';
import 'package:knovator/widget/text_edit_field.dart';
import 'package:knovator/widget/text_widget.dart';

import '../../model/skillModel/skill_model.dart';
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
    if (addResumeController.isEdit.value == false) {
      addResumeController.educationDetailsList.add(EducationDetails(
          schoolName: TextEditingController(),
          graduationDate: TextEditingController(),
          percent: TextEditingController()));
      addResumeController.workExperinceList.add(WorkExpDetails(
          jobTitleController: TextEditingController(),
          comapnyNameController: TextEditingController(),
          dateOfJoinController: TextEditingController(),
          isCurrentlyWorking: false,
          dateOfResignController: TextEditingController()));
    } else {}
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                () => Form(
                  key: _formKey,
                  child: Column(
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
                                  valText: "Please Enter Name",
                                  controller:
                                      addResumeController.nameController),
                              const SizedBox(height: 8),
                              TextEditField.textField(
                                  hintText: "Enter Phone",
                                  valText: "Please Enter Phone",
                                  textInputType: TextInputType.phone,
                                  controller:
                                      addResumeController.phoneController),
                              const SizedBox(height: 8),
                              TextEditField.textField(
                                  hintText: "Enter Email",
                                  valText: "Please Enter Email",
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
                      const EductionalDetailsWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const TextWidget(text: "I'm Fresher", textSize: 16),
                          const SizedBox(width: 8),
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
                        const WorkExpWidget(),
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
                                    text: "Skill(s) Details",
                                    textSize: 16,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        addResumeController.skillDetailsList
                                            .add(SkillDetails(
                                          skillName: TextEditingController(),
                                        ));
                                        setState(() {});
                                      },
                                      child:
                                          const Icon(Icons.add_circle_outline))
                                ],
                              ),
                              if (addResumeController
                                  .skillDetailsList.isNotEmpty)
                                const SizedBox(height: 8),
                              Wrap(
                                alignment: WrapAlignment.start,
                                direction: Axis.horizontal,
                                runSpacing: 8,
                                children: List.generate(
                                  addResumeController.skillDetailsList.length,
                                  (index) => SizedBox(
                                    width: 160,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 130,
                                          child: TextEditField.textField(
                                              hintText:
                                                  "Enter Skill (${index + 1})",
                                              controller: addResumeController
                                                  .skillDetailsList[index]
                                                  .skillName),
                                        ),
                                        SizedBox(
                                          width: 20,
                                          child: InkWell(
                                              onTap: () {
                                                addResumeController
                                                    .skillDetailsList
                                                    .removeAt(index);
                                                setState(() {});
                                              },
                                              child: const Icon(
                                                Icons.close,
                                                color: AppColors.redColors,
                                                size: 22,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const TextWidget(
                                    text: "Language(s)",
                                    textSize: 16,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        addResumeController.languageDetailsList
                                            .add(LanguageDetails(
                                          language: TextEditingController(),
                                        ));
                                        setState(() {});
                                      },
                                      child:
                                          const Icon(Icons.add_circle_outline))
                                ],
                              ),
                              if (addResumeController
                                  .languageDetailsList.isNotEmpty)
                                const SizedBox(height: 8),
                              Wrap(
                                alignment: WrapAlignment.start,
                                direction: Axis.horizontal,
                                runSpacing: 8,
                                children: List.generate(
                                  addResumeController
                                      .languageDetailsList.length,
                                  (index) => SizedBox(
                                    width: Get.width,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextEditField.textField(
                                              hintText:
                                                  "Enter Language (${index + 1})",
                                              controller: addResumeController
                                                  .languageDetailsList[index]
                                                  .language),
                                        ),
                                        InkWell(
                                            onTap: () {
                                              addResumeController
                                                  .languageDetailsList
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
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      AppButton.primaryButton(
                          onButtonPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (addResumeController.isEdit.value) {
                                addResumeController.resumeList[
                                    addResumeController
                                        .selectedIndex] = ResumeViewDetails(
                                    nameController:
                                        addResumeController.nameController,
                                    addressController:
                                        addResumeController.addressController,
                                    emailController:
                                        addResumeController.emailController,
                                    phoneController:
                                        addResumeController.phoneController,
                                    summaryController:
                                        addResumeController.summaryController,
                                    educationDetailsList: addResumeController
                                        .educationDetailsList,
                                    isFresher: addResumeController.isFresher,
                                    workExperinceList:
                                        addResumeController.workExperinceList,
                                    languageDetailsList:
                                        addResumeController.languageDetailsList,
                                    skillDetailsList:
                                        addResumeController.skillDetailsList);
                                getStore.erase();
                                getStore.write('resume',
                                    jsonEncode(addResumeController.resumeList.toString()));
                              } else {
                                ResumeViewDetails resumeViewDetails;
                                resumeViewDetails = ResumeViewDetails(
                                    nameController:
                                        addResumeController.nameController,
                                    addressController:
                                        addResumeController.addressController,
                                    emailController:
                                        addResumeController.emailController,
                                    phoneController:
                                        addResumeController.phoneController,
                                    summaryController:
                                        addResumeController.summaryController,
                                    educationDetailsList: addResumeController
                                        .educationDetailsList,
                                    isFresher: addResumeController.isFresher,
                                    workExperinceList:
                                        addResumeController.workExperinceList,
                                    languageDetailsList:
                                        addResumeController.languageDetailsList,
                                    skillDetailsList:
                                        addResumeController.skillDetailsList);

                                addResumeController.resumeList.insert(
                                    addResumeController.resumeList.length,
                                    resumeViewDetails);
                                getStore.erase();
                                getStore.write('resume',
                                    jsonEncode(addResumeController.resumeList.toString()));
                              }
                              Get.back();
                            }
                          },
                          title: "Submit")
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  static var getStore = GetStorage();
}
