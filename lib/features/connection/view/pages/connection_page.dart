import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/bottom_buttons_widget.dart';
import '../widgets/companies_grid_list_widget.dart';

class ConnectionPage extends StatelessWidget {
  const ConnectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            children: [
              // Grid of companies
              Expanded(
                child: CompaniesGrid(),
              ),

              // Bottom action buttons
              SizedBox(height: 15.h),
              BottomActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
