import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/add_job_controller.dart';


class AddMakePostPage extends StatelessWidget {
  final AddJobController controller = Get.put(AddJobController());

  AddMakePostPage({super.key});

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
          Obx(
            () => controller.isLoading.value
                ? Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : TextButton(
                    onPressed: controller.postJob,
                    child: Text(
                      'Post',
                      style: TextStyle(fontSize: 14.sp, color: Colors.blue),
                    ),
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
                hintText: 'Remote, On-site, Hybrid',
              ),
              JobFormField(
                label: 'Location',
                onChanged: controller.updateLocation,
                hintText: 'City, State or Remote',
              ),
              JobFormField(
                label: 'Company',
                onChanged: controller.updateCompany,
              ),
              JobFormField(
                label: 'Employment type',
                onChanged: controller.updateEmploymentType,
                hintText: 'Full-time, Part-time, Contract',
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: JobFormField(
                      label: 'Salary',
                      onChanged: controller.updateSalary,
                      hintText: '\$50,000',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      value: 'monthly',
                      items: [
                        'yearly',
                        'monthly',
                        'weekly',
                        'hourly',
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) controller.updateSalaryPeriod(value);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              JobFormField(
                label: 'Description',
                onChanged: controller.updateDescription,
                maxLines: 5,
                hintText: 'Job responsibilities, qualifications, benefits...',
              ),
              Obx(() => controller.errorMessage.value.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        controller.errorMessage.value,
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  : SizedBox.shrink()),
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
  final String? hintText;
  final TextInputType keyboardType;

  const JobFormField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.maxLines = 1,
    this.hintText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

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
              Icon(Icons.edit, size: 20.sp, color: Colors.orange),
            ],
          ),
          SizedBox(height: 8.h),
          TextField(
            onChanged: onChanged,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 12.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
