import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ishla_app/features/profile/view/widgets/phone_number_widget.dart';
import 'package:ishla_app/features/profile/view/widgets/profile_text_field_widget.dart';
import 'package:ishla_app/features/profile/view/widgets/save_button_widget.dart';

import '../../controller/profile_controller.dart';
import 'gender_selection_widget.dart';

class ProfileFormWidget extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => ProfileTextField(
              label: 'FULLNAME',
              initialValue: controller.fullName.value,
            ),
          ),
          Obx(
            () => ProfileTextField(
              label: 'Date of birth',
              initialValue: controller.dateOfBirth.value,
              suffixIcon: Icon(Icons.calendar_today, size: 20.sp),
            ),
          ),
          GenderSelectionWidget(),
          Obx(() => ProfileTextField(
                label: 'Email address',
                initialValue: controller.email.value,
              )),
          PhoneNumberField(),
          Obx(() => ProfileTextField(
                label: 'Location',
                initialValue: controller.location.value,
              )),
          SizedBox(height: 20.h),
          SaveButtonWidget(),
        ],
      ),
    );
  }
}
