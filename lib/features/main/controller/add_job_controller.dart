import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddJobController extends GetxController {
  // Form values
  var position = ''.obs;
  var workplaceType = ''.obs;
  var location = ''.obs;
  var company = ''.obs;
  var employmentType = ''.obs;
  var description = ''.obs;
  var salary = ''.obs;
  var salaryPeriod = 'monthly'.obs;
  var companyIconCode = Icons.business.codePoint.obs;
  var companyIconColor = Colors.blue.value.obs;

  // Form validators
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Update methods
  void updatePosition(String value) => position.value = value;
  void updateWorkplaceType(String value) => workplaceType.value = value;
  void updateLocation(String value) => location.value = value;
  void updateCompany(String value) => company.value = value;
  void updateEmploymentType(String value) => employmentType.value = value;
  void updateDescription(String value) => description.value = value;
  void updateSalary(String value) => salary.value = value;
  void updateSalaryPeriod(String value) => salaryPeriod.value = value;

  // Post job to Firebase
  Future<void> postJob() async {
    if (position.value.isEmpty) {
      errorMessage.value = 'Job position is required';
      Get.snackbar('Error', 'Job position is required',
          backgroundColor: Colors.red[100]);
      return;
    }

    try {
      isLoading.value = true;

      // Add job to Firestore

      Get.back();
      Get.snackbar('Success', 'Job posted successfully',
          backgroundColor: Colors.green[100]);
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar('Error', 'Failed to post job: ${e.toString()}',
          backgroundColor: Colors.red[100]);
    } finally {
      isLoading.value = false;
    }
  }
}