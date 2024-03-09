import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../model/educationDetailsModel/edu_details_model.dart';
import '../../model/languageModel/language_model.dart';
import '../../model/resumeViewModel/resume_view_model.dart';
import '../../model/skillModel/skill_model.dart';
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
  List<SkillDetails> skillDetailsList = [];

  //language
  List<LanguageDetails> languageDetailsList = [];

  //resume view
  RxList<ResumeViewDetails> resumeList =<ResumeViewDetails> [].obs;

  RxBool isEdit = false.obs;
  int selectedIndex = -1;
  fillData(int index) {
    nameController = resumeList[index].nameController;
    phoneController = resumeList[index].phoneController;
    emailController = resumeList[index].emailController;
    addressController = resumeList[index].addressController;
    summaryController = resumeList[index].summaryController;
    educationDetailsList = resumeList[index].educationDetailsList;
    workExperinceList = resumeList[index].workExperinceList;
    isFresher = resumeList[index].isFresher;
    skillDetailsList = resumeList[index].skillDetailsList;
    languageDetailsList = resumeList[index].languageDetailsList;
  }

  clearData() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
    summaryController.clear();
    educationDetailsList.clear();
    workExperinceList.clear();
    isFresher.value = false;
    skillDetailsList.clear();
    languageDetailsList.clear();
  }
}
