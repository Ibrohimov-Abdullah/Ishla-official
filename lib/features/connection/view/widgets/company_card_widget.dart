import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ishla_app/core/constants/custom_opacity.dart';

import '../../../../core/data/models/company_model.dart';

class CompanyCard extends StatelessWidget {
  final CompanyData company;
  final void Function()? onTap;

  const CompanyCard({
    super.key,
    required this.company,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.customOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5.h),
            // Company Logo
            buildCompanyLogo(),
            SizedBox(height: 10.h),

            // Company Name
            Text(
              company.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6.h),

            // Followers
            Text(
              '${company.followers} Followers',
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 15.h),

            // Follow Button
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20.0),
              child: MaterialButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                minWidth: 110.w,
                height: 35.h,
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                  child: Text(
                    'Follow',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
          ],
        ),
      ),
    );
  }

  Widget buildCompanyLogo() {
    Widget logoWidget;

    // Create custom logos for each company
    switch (company.name) {
      case 'Google Inc':
        logoWidget = buildColorfulLogo([
          Colors.red,
          Colors.yellow,
          Colors.green,
          Colors.blue,
        ], 'G');
        break;
      case 'Dribbble Inc':
        logoWidget = Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: company.logoColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.sports_basketball,
            color: Colors.white,
            size: 24.sp,
          ),
        );
        break;
      case 'Twitter Inc':
        logoWidget = Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: company.logoColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.flutter_dash, // Using this as a Twitter-like icon
            color: Colors.white,
            size: 24.sp,
          ),
        );
        break;
      case 'Apple Inc':
        logoWidget = Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: company.logoColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.apple,
            color: Colors.white,
            size: 24.sp,
          ),
        );
        break;
      case 'Facebook Inc':
        logoWidget = Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: company.logoColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              'f',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        break;
      case 'Microsoft Inc':
        logoWidget = Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(12.w),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(color: Colors.red),
              Container(color: Colors.green),
              Container(color: Colors.blue),
              Container(color: Colors.yellow),
            ],
          ),
        );
        break;
      default:
        // Generic logo for any other company
        logoWidget = Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: company.logoColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              company.logoIcon,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
    }

    return logoWidget;
  }

  Widget buildColorfulLogo(List<Color> colors, String text) {
    return Container(
      width: 60.w,
      height: 60.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: CustomPaint(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
