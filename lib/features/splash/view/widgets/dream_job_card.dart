import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/style/app_colors.dart';
import '../../../main/view/pages/main_page.dart';


class DreamJobCard extends StatelessWidget {
  const DreamJobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title with two different styles
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 34.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.1.h,
              ),
              children: [
                const TextSpan(text: "Find Your\n"),
                TextSpan(
                  text: "Dream Job",
                  style: TextStyle(
                    color: AppColors.lightOrange,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const TextSpan(text: "\nHere!"),
              ],
            ),
          ),
          20.verticalSpace,
          // Description text
          Text(
            "Explore all the most exciting job roles based on your interest and study major.",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
              height: 1.4.h,
            ),
          ),

          // Arrow button
          Padding(
            padding: REdgeInsets.only(right: 10.0, left: 250),
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                Get.offAll(MainPage());
              },
              minWidth: 62.w,
              height: 62.h,
              color: AppColors.lightOrange,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(500),
                borderSide: BorderSide.none,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 28.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}