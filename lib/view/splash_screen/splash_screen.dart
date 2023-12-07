import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/view/auth_screen/login_screen.dart';
import 'package:emart/widget_common/applogo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // creating a method change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      //using getX
      Get.to(() => const LoginScreen());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            40.heightBox,
            appLogoWidget(),
            20.heightBox,
            appName.text.fontFamily(bold).size(22).white.make(),
            10.heightBox,
            appVersion.text.white.make(),
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            40.heightBox,
            //our splash screen UI is completed
          ],
        ),
      ),
    );
  }
}
