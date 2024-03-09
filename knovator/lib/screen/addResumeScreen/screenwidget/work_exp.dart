import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/addResumeController/add_resume_controller.dart';
import '../../../model/workExperienceModel/work_exp_model.dart';
import '../../../utils/const/app_colors.dart';
import '../../../utils/helper/helper.dart';
import '../../../widget/date_picker.dart';
import '../../../widget/text_edit_field.dart';
import '../../../widget/text_widget.dart';

class WorkExpWidget extends StatefulWidget {
  const WorkExpWidget({super.key});

  @override
  State<WorkExpWidget> createState() => _WorkExpWidgetState();
}

class _WorkExpWidgetState extends State<WorkExpWidget> {
  AddResumeController addResumeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      text: "Work Experience",
                      textSize: 16,
                    ),
                    InkWell(
                        onTap: () {
                          addResumeController.workExperinceList.add(
                              WorkExpDetails(
                                  jobTitleController: TextEditingController(),
                                  comapnyNameController:
                                      TextEditingController(),
                                  dateOfJoinController: TextEditingController(),
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
                  itemCount: addResumeController.workExperinceList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(text: "${index + 1}", textSize: 15),
                            if (index > 0)
                              InkWell(
                                  onTap: () {
                                    addResumeController.workExperinceList
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
                            hintText: "Enter Job Title",
                            valText: "Please Enter Job Title",
                            controller: addResumeController
                                .workExperinceList[index].jobTitleController),
                        const SizedBox(height: 8),
                        TextEditField.textField(
                            hintText: "Enter Company Name",
                            valText: "Please Enter Company Name",
                            controller: addResumeController
                                .workExperinceList[index]
                                .comapnyNameController),
                        Row(
                          children: [
                            TextWidget(
                                text: "Currently Working Here", textSize: 16),
                            SizedBox(width: 8),
                            Checkbox(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                visualDensity: VisualDensity.standard,
                                value: addResumeController
                                    .workExperinceList[index]
                                    .isCurrentlyWorking,
                                checkColor: AppColors.white,
                                activeColor: AppColors.primaryColor,
                                onChanged: (val) {
                                  addResumeController.workExperinceList[index]
                                      .isCurrentlyWorking = val!;
                                  setState(() {});
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextEditField.textField(
                                  hintText: "Date Of Joining",
                                  valText: "Please Enter DOJ",
                                  readOnly: true,
                                  ontap: () {
                                    selectJoiningDate(index);
                                  },
                                  controller: addResumeController
                                      .workExperinceList[index]
                                      .dateOfJoinController),
                            ),
                            if (!addResumeController
                                .workExperinceList[index].isCurrentlyWorking)
                              const SizedBox(width: 8),
                            if (!addResumeController
                                .workExperinceList[index].isCurrentlyWorking)
                              Expanded(
                                child: TextEditField.textField(
                                    hintText: "Date Of Resign",
                                    readOnly: true,
                                    valText: !addResumeController
                                            .workExperinceList[index]
                                            .isCurrentlyWorking
                                        ? "Please Enter DOR"
                                        : null,
                                    ontap: () {
                                      selectResignDate(index);
                                    },
                                    controller: addResumeController
                                        .workExperinceList[index]
                                        .dateOfResignController),
                              ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ])),
    );
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
