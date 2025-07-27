import 'package:get/get.dart';

import '../view/pages/info_page.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAll(InfoPage());
    });
  }
}
