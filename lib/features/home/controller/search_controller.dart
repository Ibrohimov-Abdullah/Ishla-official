import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  RxList specializations = [
    {'name': 'Design', 'jobs': '140 Jobs', 'color': 0xFFFFE0B2, 'icon': Icons.brush},
    {'name': 'Finance', 'jobs': '250 Jobs', 'color': 0xFFE1F5FE, 'icon': Icons.account_balance},
    {'name': 'Education', 'jobs': '120 Jobs', 'color': 0xFFE8F5E9, 'icon': Icons.school},
    {'name': 'Restaurant', 'jobs': '85 Jobs', 'color': 0xFFFFF3E0, 'icon': Icons.restaurant},
    {'name': 'Health', 'jobs': '235 Jobs', 'color': 0xFFF3E5F5, 'icon': Icons.favorite},
    {'name': 'Programmer', 'jobs': '412 Jobs', 'color': 0xFFE0F7FA, 'icon': Icons.code},
  ].obs;

  var searchQuery = ''.obs;
  var selectedIndex = (-1).obs; // Track the selected card index

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void selectSpecialization(int index) {
    selectedIndex.value = index;
  }
}