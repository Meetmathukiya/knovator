import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../model/educationDetailsModel/edu_details_model.dart';
import '../../model/workExperienceModel/work_exp_model.dart';

class AddResumeController extends GetxController {
  //personal
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  //summary
  TextEditingController summaryController = TextEditingController();

  //education
  List<EducationDetails> educationDetailsList = [];

  //workExp
  List<WorkExpDetails> workExperinceList = [];
  RxBool isFresher = false.obs;

  //skill
  TextEditingController skillController = TextEditingController();

  //language
  TextEditingController languageController = TextEditingController();
}
