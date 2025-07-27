import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ishla_app/core/style/app_colors.dart';
import 'package:ishla_app/features/auth/view/pages/sign_up_page.dart';
import '../../controller/login_controller.dart';
import 'forget_password_page.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              HeaderWidget(),
              SizedBox(height: 30.h),
              FormWidget(controller: controller),
              SizedBox(height: 20.h),
              ButtonsWidget(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

// Header Widget
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome Back",
          style: GoogleFonts.poppins(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, ",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

// Form Widget
class FormWidget extends StatelessWidget {
  final LoginController controller;

  const FormWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        Text(
          "Email",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Obx(
              () => TextField(
            controller: controller.emailController,
            decoration: InputDecoration(
              hintText: "Brandonelouis@gmail.com",
              hintStyle: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: controller.emailError.value.isNotEmpty ? Colors.red : Colors.black54,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: controller.emailError.value.isNotEmpty
                    ? BorderSide(color: Colors.red, width: 1.w)
                    : BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              errorText: controller.emailError.value.isNotEmpty
                  ? controller.emailError.value
                  : null,
              errorStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.red,
              ),
            ),
            onChanged: (value) {
              // Clear error when user starts typing
              controller.emailError.value = '';
            },
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          "Password",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Obx(
              () => TextField(
            controller: controller.passwordController,
            obscureText: !controller.isPasswordVisible.value,
            decoration: InputDecoration(
              hintText: "••••••••",
              hintStyle: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: controller.passwordError.value.isNotEmpty ? Colors.red : Colors.black54,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: controller.passwordError.value.isNotEmpty
                    ? BorderSide(color: Colors.red, width: 1.w)
                    : BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                  color: controller.passwordError.value.isNotEmpty ? Colors.red : Colors.grey[600],
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
              errorText: controller.passwordError.value.isNotEmpty
                  ? controller.passwordError.value
                  : null,
              errorStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.red,
              ),
            ),
            onChanged: (value) {
              // Clear error when user starts typing
              controller.passwordError.value = '';
            },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Obx(
                      () => Checkbox(
                    value: controller.rememberMe.value,
                    onChanged: controller.toggleRememberMe,
                    activeColor: Colors.purple[100],
                    checkColor: Colors.white,
                  ),
                ),
                Text(
                  "Remember me",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.to(ForgotPasswordPage());
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Buttons Widget
class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find();
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            controller.validateAndLogin();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightOrange,
            minimumSize: Size(double.infinity, 55.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text(
            "LOGIN",
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            minimumSize: Size(double.infinity, 50.h),
            side: BorderSide(color: Colors.grey),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/google_icon.svg",
                height: 20.h,
                width: 20.w,
              ),
              SizedBox(width: 12.w),
              Text(
                "SIGN IN WITH GOOGLE",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You don’t have an account yet?",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(
                  SignUpPage(),
                );
              },
              child: Text(
                "Sign up",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: Colors.orange,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}