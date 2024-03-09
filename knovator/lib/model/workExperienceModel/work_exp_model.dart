import 'package:flutter/material.dart';

class WorkExpDetails {
  TextEditingController jobTitleController;
  TextEditingController comapnyNameController;
  TextEditingController dateOfJoinController;
  TextEditingController dateOfResignController;
  bool isCurrentlyWorking;
  WorkExpDetails({
    required this.jobTitleController,
    required this.comapnyNameController,
    required this.dateOfJoinController,
    required this.dateOfResignController,
    required this.isCurrentlyWorking,
  });
}
