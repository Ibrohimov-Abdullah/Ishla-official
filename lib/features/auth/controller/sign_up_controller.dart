import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/data/models/login_sing_in_model.dart';
import '../../../core/data/services/di_service.dart';
import '../../../core/data/services/snack_bar_service.dart';
import '../../../core/storage/app_storage.dart';
import '../view/pages/check_emai_page.dart';


class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  var rememberMe = false.obs;
  var isPasswordVisible = false.obs;

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  RxBool isRegisterLoading = false.obs;

  registerUser() async {
    log("Info: email: ${emailController.text}, ${fullNameController.text}, ${passwordController.text}");
    Map<String, Object?> information = {
      "email": emailController.text,
      "password1": passwordController.text,
      "password2": passwordController.text,
      "full_name": fullNameController.text,
    };

    isRegisterLoading.value = true;

    String? info = await DioService.postData(ApiConstants.apiRegistration, information);

    // Check if the info is null or contains an error message
    if (info != null) {
      LoginSignModel model = loginSignModelFromJson(info);
      await AppStorage.store(key: StorageKey.accessToken, value: model.access!);
      await AppStorage.store(key: StorageKey.isUserHave, value: "have");
      // Success case
      isRegisterLoading.value = false;
      SnackbarUtil.showSuccess("Biz sizning emailingizga tasdiqlash linkini yubordik!");
      Get.to(
        CheckEmailPage(
          email: emailController.text,
        ),
      );
    } else {
      // Failure case
      isRegisterLoading.value = false;
      SnackbarUtil.showError("Iltimos keyinroq urinib ko'ring");
    }
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool validatePassword(String password) {
    return password.length >= 6;
  }


  final emailError = ''.obs;
  final passwordError = ''.obs;
  final fullNameError = ''.obs;

  bool validateFullName(String fullName) {
    return fullName.trim().isNotEmpty;
  }

  void validateAndRegister() {
    fullNameError.value = '';
    emailError.value = '';
    passwordError.value = '';

    bool isValid = true;

    if (!validateFullName(fullNameController.text)) {
      fullNameError.value = "Ismingiz to'liq bo'lishi kerak!";
      isValid = false;
    }

    if (!validateEmail(emailController.text)) {
      emailError.value = 'Iltimos mavjud emailni kiriting';
      isValid = false;
    }

    if (!validatePassword(passwordController.text)) {
      passwordError.value = 'Parol raqam, katta xarif, kichik xariflar va \nmaxsus belgilar bo\'lishi kerak. 8 belgi';
      isValid = false;
    }

    if (isValid) {
      registerUser();
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
