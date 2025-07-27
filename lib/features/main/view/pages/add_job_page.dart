import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/add_job_controller.dart';


class AddJobPage extends StatelessWidget {
  final AddJobController controller = Get.put(AddJobController());

  AddJobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Add a job',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: controller.postJob,
            child: Text(
              'Post',
              style: TextStyle(fontSize: 14.sp, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JobFormField(
                label: 'Job position*',
                onChanged: controller.updatePosition,
              ),
              JobFormField(
                label: 'Type of workplace',
                onChanged: controller.updateWorkplaceType,
              ),
              JobFormField(
                label: 'Location',
                onChanged: controller.updateLocation,
              ),
              JobFormField(
                label: 'Company',
                onChanged: controller.updateCompany,
              ),
              JobFormField(
                label: 'Employment type',
                onChanged: controller.updateEmploymentType,
              ),
              JobFormField(
                label: 'Description',
                onChanged: controller.updateDescription,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Job Form Field Widget
class JobFormField extends StatelessWidget {
  final String label;
  final Function(String) onChanged;
  final int maxLines;

  const JobFormField({super.key,
    required this.label,
    required this.onChanged,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.add, size: 20.sp, color: Colors.orange),
            ],
          ),
          SizedBox(height: 8.h),
          TextField(
            onChanged: onChanged,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}