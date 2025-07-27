import 'package:get/get.dart';

class JobOptionsController extends GetxController {
  void sendMessage() {
    Get.snackbar('Action', 'Send Message clicked');
  }

  void share() {
    Get.snackbar('Action', 'Share clicked');
  }

  void delete() {
    Get.snackbar('Action', 'Delete clicked');
  }

  void apply() {
    Get.snackbar('Action', 'Apply clicked');
  }
}