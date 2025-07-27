import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[900]!, Colors.blue[700]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 40.h,
            right: 16.w,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.share, size: 24.sp, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings, size: 24.sp, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 50.sp, color: Colors.white),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Orlando Diggs',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'California, USA',
                  style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                ),
                SizedBox(height: 8.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change image',
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
