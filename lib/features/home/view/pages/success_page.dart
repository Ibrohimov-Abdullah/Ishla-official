import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../main/view/pages/main_page.dart';
import '../widgets/custom_button_widget.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.blue.shade100,
              child: Text('G', style: TextStyle(fontSize: 20.sp)),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Google', style: TextStyle(fontSize: 16.sp)),
                Text('UI/UX Designer • California', style: TextStyle(fontSize: 12.sp)),
              ],
            ),
          ],
        ),
        actions: [
          Text('1 day ago', style: TextStyle(fontSize: 12.sp)),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Successful!',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              'Congratulations, Your application has been sent.',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            CustomButton(
              text: 'Find a Similar Job',
              onPressed: () {},
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10.h),
            CustomButton(
              text: 'Back to Home',
              onPressed: () {
                Get.offAll(MainPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
