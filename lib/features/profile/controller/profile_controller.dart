import 'package:get/get.dart';

class ProfileController extends GetxController {
  var fullName = 'Brandone Louis'.obs;
  var dateOfBirth = '06 August 1992'.obs;
  var gender = 'Male'.obs;
  var email = 'brandoneLouis@gmail.com'.obs;
  var phoneNumber = '619 3456 7890'.obs;
  var location = 'California, United States'.obs;

  void updateGender(String newGender) {
    gender.value = newGender;
  }

  void saveProfile() {
    // Simulate saving to a backend
    Get.snackbar('Success', 'Profile updated successfully');
  }
}