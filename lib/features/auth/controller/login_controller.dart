import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/models/login_sing_in_model.dart';
import '../../../core/data/services/di_service.dart';
import '../../../core/data/services/snack_bar_service.dart';
import '../../../core/storage/app_storage.dart';
import '../../main/view/pages/main_page.dart';


class LoginController extends GetxController {
  var rememberMe = false.obs;
  var isPasswordVisible = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailError = ''.obs;
  final passwordError = ''.obs;

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  bool validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool validatePassword(String password) {
    // At least 6 characters, one uppercase letter, one number
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
    return passwordRegex.hasMatch(password);
  }
  RxBool isLoginLoading = false.obs;
  
  void validateAndLogin() {
    emailError.value = '';
    passwordError.value = '';

    bool isValid = true;

    if (!validateEmail(emailController.text)) {
      emailError.value = 'Emailingizni kiriting';
      isValid = false;
    }

    if (!validatePassword(passwordController.text)) {
      passwordError.value = 'Parolni kiritng';
      isValid = false;
    }

    if (isValid) {
      loginUser();
    }
  }

  void loginUser() async{
    isLoginLoading.value = true;
    Map<String, Object?> data = {
      "username":"",
      "email" : emailController.text,
      "password" : passwordController.text,
    };
    String? info = await DioService.postData(ApiConstants.apiLogin, data);
    if(info != null){
      log(info);
      LoginSignModel model = loginSignModelFromJson(info);
      await AppStorage.store(key: StorageKey.accessToken, value: model.access!);
      await AppStorage.store(key: StorageKey.isUserHave, value: "have");
      isLoginLoading.value = false;
      SnackbarUtil.showSuccess("Muvafaqiyatli!");
      Get.offAll(MainPage());
    }else{
      SnackbarUtil.showError("Iltimos keyinroq sinab ko'rin!");
      isLoginLoading.value = false;
    }
    isLoginLoading.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}