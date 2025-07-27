import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/data/models/companies_model.dart';
import '../../../core/data/services/di_service.dart';
import '../view/pages/home_detail_page.dart';

class HomePageController extends GetxController {
  final searchController = TextEditingController();
  var isLoading = false.obs;
  var sampleJob = {
    'title': 'Product Designer',
    'company': 'Google Inc.',
    'location': 'California, USA',
    'salary': '\$15K',
    'salaryPeriod': '/month',
    'jobType': 'Full time',
    'description': 'Design user interfaces and experiences for Google products.',
    'requirements': ['3+ years of experience', 'UI/UX skills', 'Communication skills'],
    'workplaceType': 'Hybrid',
  };

  @override
  void onInit() {
    super.onInit();
    fetchRecentJobs();
    getCompanies();
  }



  Future<void> fetchRecentJobs() async {}

  void navigateToJobDetail() {
    Get.to(() => HomeDetailPage());
  }

  RxList<CompaniesModel> companies = <CompaniesModel>[].obs;
  RxBool isCompaniesCame = false.obs;

  getCompanies() async{
    String? info = await DioService.getData(ApiConstants.apiCompanies,);
    if(info != null){
      log("\n\nCompanies Came\t$info\n\n");
    }
  }
}
