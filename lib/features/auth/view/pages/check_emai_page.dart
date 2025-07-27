import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'login_page.dart';

class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({super.key, this.email});
  final String? email;

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Check Your Email', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            Text(
              'We have sent a password reset email to\nbrandonelouis@gmail.com',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                30.horizontalSpace,
                SvgPicture.asset(
                  "assets/icons/check_email_icon.svg",
                ),
              ],
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  openEmailClient(widget.email??"");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text('OPEN YOUR EMAIL',
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
            ),
            SizedBox(height: 16.h),
            Text(
              "Didn't receive the email? Resend",
              style: TextStyle(fontSize: 13.sp, color: Colors.orange),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> openEmailClient(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
  );

  try {
    // No need for canLaunchUrl in newer versions; launchUrl handles it
    await launchUrl(emailUri, mode: LaunchMode.externalApplication);
  } catch (e) {
    // Handle error (e.g., show a SnackBar)
    debugPrint('Could not launch email app: $e');

  }
}