import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/style/app_colors.dart';
import '../../controller/job_post_page_controller.dart';
import '../../controller/main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var postController = Get.put(JobPostController());
    var controller = Get.put(MainController());
    return Scaffold(
      body: Obx(
        () => PageView(
          children: [controller.pages[controller.selectedIndex.value]],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.colorChanger(value);
          },
          selectedItemColor: Colors.orange,
          currentIndex: controller.selectedIndex.value,
          items: [
            BottomNavigationBarItem(
              icon:
                  controller.indexOne.value ? SvgPicture.asset("assets/icons/home_active.svg") : SvgPicture.asset("assets/icons/home.svg"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: controller.indexTwo.value
                  ? SvgPicture.asset("assets/icons/connection_active.svg")
                  : SvgPicture.asset("assets/icons/connection.svg"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: MaterialButton(
                height: 50.h,
                minWidth: 50.w,
                onPressed: () {
                  controller.indexTwo.value = true;
                  postController.showAddPostBottomSheet(context);
                },
                padding: EdgeInsets.zero,
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(500),
                ),
                color: AppColors.lightOrange,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon:
                  controller.indexFour.value ? SvgPicture.asset("assets/icons/chat_active.svg") : SvgPicture.asset("assets/icons/chat.svg"),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: controller.indexFive.value
                  ? SvgPicture.asset("assets/icons/favorite_active.svg")
                  : SvgPicture.asset("assets/icons/favorite.svg"),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
