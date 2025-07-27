import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ishla_app/features/auth/view/pages/login_page.dart';

import 'check_emai_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  final emailController = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Text(
              'To reset your password, please enter your email.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 30.h),
            SvgPicture.asset("assets/icons/icon_forget_password_person.svg"),
            10.verticalSpace,
            SvgPicture.asset("assets/icons/icon_foget_password_numbers.svg"),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15.sp,
                  ),
                )
              ],
            ),
            10.verticalSpace,
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Brandonelouis@gmail.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 25.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => CheckEmailPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text('RESET PASSWORD',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: 10.h),
            MaterialButton(
              padding: EdgeInsets.zero,
              height: 50.h,
              minWidth: 325.w,
              color: Colors.grey,
              shape: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12.r),
              ),
              onPressed: () {
                Get.offAll(LoginPage());
              },
              child: Text('BACK TO LOGIN',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
