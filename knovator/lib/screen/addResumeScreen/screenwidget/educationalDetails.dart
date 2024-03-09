import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/addResumeController/add_resume_controller.dart';
import '../../../model/educationDetailsModel/edu_details_model.dart';
import '../../../utils/const/app_colors.dart';
import '../../../utils/helper/helper.dart';
import '../../../widget/date_picker.dart';
import '../../../widget/text_edit_field.dart';
import '../../../widget/text_widget.dart';

class EductionalDetailsWidget extends StatefulWidget {
  const EductionalDetailsWidget({super.key});

  @override
  State<EductionalDetailsWidget> createState() =>
      _EductionalDetailsWidgetState();
}

class _EductionalDetailsWidgetState extends State<EductionalDetailsWidget> {
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
                  text: "Educational Details",
                  textSize: 16,
                ),
                InkWell(
                    onTap: () {
                      addResumeController.educationDetailsList.add(
                          EducationDetails(
                              schoolName: TextEditingController(),
                              graduationDate: TextEditingController(),
                              percent: TextEditingController()));
                      setState(() {});
                    },
                    child: Icon(Icons.add_circle_outline))
              ],
            ),
            const SizedBox(height: 8),
            ListView.separated(
              itemCount: addResumeController.educationDetailsList.length,
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
                                addResumeController.educationDetailsList
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
                                  valText: "Please Enter School/University Name",

                        hintText: "Enter School/University Name",
                        controller: addResumeController
                            .educationDetailsList[index].schoolName),
                            
                    const SizedBox(height: 8),
                    TextEditField.textField(
                        hintText: "Enter Graduation Date",
                                                          valText: "Please Enter Graduation Date",

                        readOnly: true,
                        ontap: () {
                          datePickerEdu(index);
                        },
                        controller: addResumeController
                            .educationDetailsList[index].graduationDate),
                    const SizedBox(height: 8),
                    TextEditField.textField(
                        hintText: "Enter Percentage",
                                                          valText: "Please Enter Percentage",

                        textInputType: TextInputType.number,
                        controller: addResumeController
                            .educationDetailsList[index].percent),
                  ],
                );
              },
            ),
          ],
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
}
