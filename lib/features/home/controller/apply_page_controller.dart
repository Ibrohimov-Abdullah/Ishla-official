import 'package:get/get.dart';

import '../view/pages/success_page.dart';

class UploadController extends GetxController {
  var isFileUploaded = false.obs;
  var fileName = ''.obs;

  void uploadFile(String name) {
    fileName.value = name;
    isFileUploaded.value = true;
  }

  void removeFile() {
    fileName.value = '';
    isFileUploaded.value = false;
  }

  void submitApplication() {
    Get.offAll(() => SuccessScreen());
  }
}