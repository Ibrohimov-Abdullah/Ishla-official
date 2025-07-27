import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ishla_app/core/constants/custom_opacity.dart';
import 'package:ishla_app/features/saved/view/pages/saved_job_list_page.dart';
import '../../controller/jobs_options_controller.dart';

class JobOptionsPage extends StatelessWidget {
  final Map<String, String> job;
  final JobOptionsController controller = Get.put(JobOptionsController());

  JobOptionsPage({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Options',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Delete all',
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          children: [
            JobCard(
              title: job['title']!,
              company: job['company']!,
              location: job['location']!,
              type: job['type']!,
              experience: job['experience']!,
              time: job['time']!,
              salary: job['salary']!,
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            OptionButton(
              icon: Icons.message,
              text: 'Send message',
              onTap: controller.sendMessage,
            ),
            OptionButton(
              icon: Icons.share,
              text: 'Shared',
              onTap: controller.share,
            ),
            OptionButton(
              icon: Icons.delete,
              text: 'Delete',
              onTap: controller.delete,
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: controller.apply,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Apply',
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusing JobCard from the previous page
// Option Button Widget
class OptionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const OptionButton({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.customOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: Colors.black),
            SizedBox(width: 12.w),
            Text(
              text,
              style: TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
