import 'package:emart/consts/consts.dart';
import 'package:emart/consts/lists.dart';
import 'package:emart/view/home_screen/home.dart';
import 'package:emart/view/auth_screen/signup_screen.dart';
import 'package:emart/widget_common/applogo_widget.dart';
import 'package:emart/widget_common/bg_widget.dart';
import 'package:emart/widget_common/custom_textfield.dart';
import 'package:emart/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.12).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Log in to $appName".text.white.fontFamily(bold).size(18).make(),
            15.heightBox,
            Column(
              children: [
                customerTextField(hint: emailHint, title: email),
                customerTextField(hint: passwordHint, title: password),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgotPassword.text.make()),
                ),
                10.heightBox,
                ourButton(
                    color: redColor,
                    title: login,
                    txtColor: whiteColor,
                    onPress: () {
                      Get.to(() => const Home());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                10.heightBox,
                ourButton(
                    color: golden,
                    title: sigNup,
                    txtColor: redColor,
                    onPress: () {
                      Get.to(() => const SignUpScreen());
                    }).box.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginWith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIconsList[index],
                                width: 30,
                              ),
                            ),
                          )),
                ),
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}
