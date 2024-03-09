import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../educationDetailsModel/edu_details_model.dart';
import '../languageModel/language_model.dart';
import '../skillModel/skill_model.dart';
import '../workExperienceModel/work_exp_model.dart';

class ResumeViewDetails {
  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController addressController;

  //summary
  TextEditingController summaryController;
  //education
  List<EducationDetails> educationDetailsList;

  //workExp
  List<WorkExpDetails> workExperinceList;
  RxBool isFresher;

  //skill
  List<SkillDetails> skillDetailsList;

  //language
  List<LanguageDetails> languageDetailsList;

  ResumeViewDetails({
    required this.nameController,
    required this.addressController,
    required this.emailController,
    required this.phoneController,
    required this.summaryController,
    required this.educationDetailsList,
    required this.isFresher,
    required this.workExperinceList,
    required this.languageDetailsList,
    required this.skillDetailsList,
  });
}
