import 'package:flutter/material.dart';
import '../widgets/profile_form_widget.dart';
import '../widgets/profile_header_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileHeaderWidget(),
            ProfileFormWidget(),
          ],
        ),
      ),
    );
  }
}
