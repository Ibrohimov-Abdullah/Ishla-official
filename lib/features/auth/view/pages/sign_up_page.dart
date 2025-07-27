import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ishla_app/features/auth/controller/sign_up_controller.dart';
import 'package:ishla_app/features/auth/view/pages/forget_password_page.dart';

import '../../../../core/constants/custom_opacity.dart';
import '../../../../core/style/app_colors.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            50.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/sign_up_icon.svg",
                ),
              ],
            ),
            20.verticalSpace,
            Text(
              "Create an Account",
              style: style.displayLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            5.verticalSpace,
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              style: style.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            30.verticalSpace,
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20.0),
              child: SignUpFormWidget(
                controller: controller,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpFormWidget extends StatelessWidget {
  final SignUpController controller;

  const SignUpFormWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        20.verticalSpace,
        Text(
          "Full name",
          style: GoogleFonts.poppins(
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Obx(
              () => TextField(
            controller: controller.fullNameController,
            decoration: InputDecoration(
              hintText: "Brandone Louis",
              hintStyle: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: controller.fullNameError.value.isNotEmpty ? Colors.red : Colors.black54,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: controller.fullNameError.value.isNotEmpty
                    ? BorderSide(color: Colors.red, width: 1.w)
                    : BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              errorText: controller.fullNameError.value.isNotEmpty
                  ? controller.fullNameError.value
                  : null,
              errorStyle: GoogleFonts.poppins(
                fontSize: 12.sp,
                color: Colors.red,
              ),
            ),
            onChanged: (value) {
              // Clear error when user starts typing
              controller.fullNameError.value = '';
            },
          ),
        ),
        SizedBox(height: 16.h),
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
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        30.verticalSpace,
        SignUpButtonsWidget(),
      ],
    );
  }
}

class SignUpButtonsWidget extends StatelessWidget {
  const SignUpButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            controller.validateAndRegister();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightOrange,
            minimumSize: Size(double.infinity, 55.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          child: Text(
            "SIGN UP",
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
              "You already have an account?",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                "Sign in",
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