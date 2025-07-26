import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ishla_app/features/auth/view/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<Color?> _color;

  void _start() => _controller.forward(from: 0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _scale = Tween<double>(
      begin: 0.5,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _color = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(_controller);
    _start();
    move();
  }

  move() async{
    await Future.delayed(Duration(seconds: 3));
    Get.offAll(LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            builder: (context, child) => Transform.scale(
              scale: _scale.value,
              child: Text(
                "Ishla",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            animation: _controller,
          ),
        ),
      ),
    );
  }
}
