import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/style/app_colors.dart';
import '../../controller/filter_page_controller.dart';

class FilterPage extends StatelessWidget {
  final FilterController controller = Get.put(FilterController());

  FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 24.sp),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Text(
                      'Filter',
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 40.w),
                ],
              ),
              SizedBox(height: 16.h),
              FilterDropdown(
                label: 'Category',
                value: controller.category,
                items: ['Design', 'Finance', 'Education'],
                onChanged: controller.updateCategory,
              ),
              FilterDropdown(
                label: 'Subcategory',
                value: controller.subcategory,
                items: ['UI/UX Design', 'Graphic Design', 'Product Design'],
                onChanged: controller.updateSubcategory,
              ),
              FilterDropdown(
                label: 'Location',
                value: controller.location,
                items: ['California', 'New York', 'Texas'],
                onChanged: controller.updateLocation,
              ),
              SizedBox(height: 16.h),
              Text(
                'Minimum Salary',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              Obx(
                () => Slider(
                  value: controller.minSalary.value,
                  activeColor: AppColors.lightOrange,
                  min: 0,
                  max: 24,
                  divisions: 24,
                  label: '\$${controller.minSalary.value.toInt()}K',
                  onChanged: controller.updateMinSalary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$0K', style: TextStyle(fontSize: 12.sp)),
                  Text('\$24K', style: TextStyle(fontSize: 12.sp)),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Job Type',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    JobTypeCheckbox(
                      label: 'Full time',
                      value: controller.jobType.value == 'Full time',
                      onChanged: (value) {
                        if (value!) controller.updateJobType('Full time');
                      },
                    ),
                    JobTypeCheckbox(
                      label: 'Part time',
                      value: controller.jobType.value == 'Part time',
                      onChanged: (value) {
                        if (value!) controller.updateJobType('Part time');
                      },
                    ),
                    JobTypeCheckbox(
                      label: 'Remote',
                      value: controller.jobType.value == 'Remote',
                      onChanged: (value) {
                        if (value!) controller.updateJobType('Remote');
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: controller.applyFilters,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightOrange,
                  minimumSize: Size(double.infinity, 50.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  'Apply Now',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Filter Dropdown Widget
class FilterDropdown extends StatelessWidget {
  final String label;
  final RxString value;
  final List<String> items;
  final Function(String) onChanged;

  const FilterDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.h),
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: DropdownButton<String>(
              value: value.value,
              isExpanded: true,
              underline: SizedBox(),
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item, style: TextStyle(fontSize: 14.sp)),
                );
              }).toList(),
              onChanged: (newValue) => onChanged(newValue!),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

// Job Type Checkbox Widget
class JobTypeCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final Function(bool?) onChanged;

  const JobTypeCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: AppColors.lightOrange,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 14.sp),
        ),
      ],
    );
  }
}
