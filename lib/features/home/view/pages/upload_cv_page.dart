import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/apply_page_controller.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/upload_card_widget.dart';
import 'cv_uploaded_page.dart';

class UploadCvPage extends StatelessWidget {
  const UploadCvPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadController controller = Get.put(UploadController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.blue.shade100,
              child: Text('G', style: TextStyle(fontSize: 20.sp)),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Google', style: TextStyle(fontSize: 16.sp)),
                Text('UI/UX Designer • California', style: TextStyle(fontSize: 12.sp)),
              ],
            ),
          ],
        ),
        actions: [
          Text('1 day ago', style: TextStyle(fontSize: 12.sp)),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Upload CV', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            UploadCard(
              onTap: () {
                controller.uploadFile('Janet Kudei - CV - UIUX Designer.pdf');
                Get.to(() => CVUploadedScreen());
              },
            ),
            SizedBox(height: 20.h),
            Text('Information', style: TextStyle(fontSize: 16.sp)),
            SizedBox(height: 10.h),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Explain why you are the right person for this job',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'Apply Now',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}