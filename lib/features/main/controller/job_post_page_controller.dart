import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../view/widgets/add_post_bottom_sheet_page.dart';

class JobPostController extends GetxController {
  RxList specializations = [
    {'name': 'Design', 'jobs': '140 Jobs', 'color': 0xFFFFE0B2, 'icon': Icons.brush},
    {'name': 'Finance', 'jobs': '250 Jobs', 'color': 0xFFE1F5FE, 'icon': Icons.account_balance},
    {'name': 'Education', 'jobs': '120 Jobs', 'color': 0xFFE8F5E9, 'icon': Icons.school},
    {'name': 'Restaurant', 'jobs': '85 Jobs', 'color': 0xFFFFF3E0, 'icon': Icons.restaurant},
    {'name': 'Health', 'jobs': '235 Jobs', 'color': 0xFFF3E5F5, 'icon': Icons.favorite},
    {'name': 'Programmer', 'jobs': '412 Jobs', 'color': 0xFFE0F7FA, 'icon': Icons.code},
  ].obs;

  var searchQuery = ''.obs;

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void showAddPostBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => AddPostBottomSheet(),
    );
  }
}
