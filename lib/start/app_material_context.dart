import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../features/splash/view/pages/splash_page.dart';

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffECEDF0),
        appBarTheme: AppBarTheme(
          color: Color(0xffECEDF0),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Color(0xffECEDF0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}