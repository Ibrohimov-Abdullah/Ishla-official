import 'package:get/get.dart';

class FilterController extends GetxController {
  var category = 'Design'.obs;
  var subcategory = 'UI/UX Design'.obs;
  var location = 'California'.obs;
  var minSalary = 0.0.obs;
  var jobType = 'Full time'.obs;

  void updateCategory(String value) => category.value = value;
  void updateSubcategory(String value) => subcategory.value = value;
  void updateLocation(String value) => location.value = value;
  void updateMinSalary(double value) => minSalary.value = value;
  void updateJobType(String value) => jobType.value = value;

  void applyFilters() {
    Get.back();
    Get.snackbar('Filters', 'Filters applied successfully');
  }
}