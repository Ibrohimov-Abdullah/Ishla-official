import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ishla_app/core/constants/custom_opacity.dart';
import '../../../../core/style/app_colors.dart';
import '../../controller/search_controller.dart';
import 'filter_page.dart';

class SearchDetailPage extends StatelessWidget {
  final SearchPageController controller = Get.put(SearchPageController());

  SearchDetailPage({super.key});

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
                    icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: SearchBar(),
                  ),
                  SizedBox(width: 8.w),
                  MaterialButton(
                    padding: EdgeInsets.zero,
                    minWidth: 50.w,
                    height: 50.h,
                    color: AppColors.lightOrange,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SvgPicture.asset("assets/icons/filter.svg"),
                    onPressed: () => Get.to(() => FilterPage()),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Specialization',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: Obx(
                  () => GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: controller.specializations.length,
                    itemBuilder: (context, index) {
                      final spec = controller.specializations[index];
                      return Obx(
                        () => SpecializationCard(
                          name: spec['name']!,
                          jobs: spec['jobs']!,
                          color: spec['color'] as int,
                          icon: spec['icon'] as IconData,
                          isSelected: controller.selectedIndex.value == index,
                          onTap: () => controller.selectSpecialization(index),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Search Bar Widget
class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchPageController>();
    return Container(
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white, // Changed to white background
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
      child: TextField(
        onChanged: controller.updateSearchQuery,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
          prefixIcon: Icon(Icons.search, size: 20.sp, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        ),
      ),
    );
  }
}

// Specialization Card Widget
class SpecializationCard extends StatelessWidget {
  final String name;
  final String jobs;
  final int color;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const SpecializationCard({
    super.key,
    required this.name,
    required this.jobs,
    required this.color,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 150.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightOrange : Color(color),
          borderRadius: BorderRadius.circular(12.r),
          border: isSelected ? Border.all(color: AppColors.lightOrange, width: 2.w) : null,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.customOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    color: Colors.white.customOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 20.sp,
                    color: Colors.black54,
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.h),
            Text(
              jobs,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
