import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/style/app_colors.dart';

class BottomActionButtons extends StatelessWidget {
  const BottomActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Posting button
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide.none),
            padding: EdgeInsets.zero,
            height: 50.h,
            color: Colors.purple[100],
            child: Center(
              child: Text(
                'Posting',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w),

        // My Connection button
        Expanded(
          child: MaterialButton(
            onPressed: () {},
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide.none),
            padding: EdgeInsets.zero,
            height: 50.h,
            color: AppColors.lightOrange,
            child: Center(
              child: Text(
                'My connection',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
