import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../core/constants/custom_opacity.dart';
import '../../../../core/style/app_colors.dart';
import '../../controller/add_post_controller.dart';

class AddPostBottomSheet extends StatelessWidget {
  final AddPostController controller = Get.put(AddPostController());

  AddPostBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4.h,
            width: 100.w,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(height: 35.h),
          Text(
            "What would you like to add?",
            style: style.displayLarge?.copyWith(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Would you like to post your tips and experiences or\ncreate a job?',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          MaterialButton(
            onPressed: controller.navigateToLogin,
            color: AppColors.lightOrange,
            minWidth: 310.w,
            height: 50.h,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide.none,
            ),
            child: Text(
              'POST',
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
          ),
          SizedBox(height: 16.h),
          MaterialButton(
            onPressed: controller.navigateToAddJob,
            color: Color(0xffD6CDFE),
            minWidth: 310.w,
            height: 50.h,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.r),
              borderSide: BorderSide.none,
            ),
            child: Text(
              'MAKE A JOB',
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
