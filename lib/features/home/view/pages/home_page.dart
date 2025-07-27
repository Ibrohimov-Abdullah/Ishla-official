import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/home_page_controller.dart';
import '../widgets/banner_widget.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/header_widget.dart';
import '../widgets/job_listing_widget.dart';
import '../widgets/section_title_widget.dart';
import 'home_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomePageController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with greeting and profile pic
              const HeaderWidget(),
              SizedBox(height: 20.h),

              // Search Bar Widget
              CustomSearchBar(controller: controller.searchController),
              SizedBox(height: 25.h),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const PromotionalBannerWidget(),
                      SizedBox(height: 25.h),

                      // Recent Job List Text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionTitleWidget(title: 'Recent Job List'),
                          TextButton(
                            onPressed: () => Get.to(() => HomeDetailPage()),
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),

                      // Job Listings
                      Obx(() {
                        if (controller.isLoading.value) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.orange,
                            ),
                          );
                        }

                        return Column(
                          children: List.generate(
                            3,
                            (index) {
                              // Convert int value to IconData and Color
                              return Column(
                                children: [
                                  JobListingWidget(
                                    jobTitle: 'Untitled Position',
                                    company: 'Unknown Company',
                                    location: 'Remote',
                                    salary: '\$10 000',
                                    salaryPeriod: '/month',
                                    jobType: 'Full time',
                                    companyIconColor: Colors.black,
                                    onPressed: () => controller.navigateToJobDetail(),
                                  ),
                                  SizedBox(height: 15.h),
                                ],
                              );
                            },
                          ),
                        );
                      },),
                    ],
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
