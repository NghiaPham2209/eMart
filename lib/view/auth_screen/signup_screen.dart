import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget_common/applogo_widget.dart';
import '../../widget_common/bg_widget.dart';
import '../../widget_common/custom_textfield.dart';
import '../../widget_common/our_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              appLogoWidget(),
              10.heightBox,
              "Join the $appName".text.white.fontFamily(bold).size(18).make(),
              15.heightBox,
              Column(
                children: [
                  customerTextField(hint: nameHint, title: name),
                  customerTextField(hint: emailHint, title: email),
                  customerTextField(hint: passwordHint, title: password),
                  customerTextField(hint: passwordHint, title: confirmPassword),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgotPassword.text.make()),
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      Checkbox(
                        activeColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        },
                      ),
                      1.widthBox,
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontSize: 16.0,
                                    color: fontGrey,
                                  )),
                              TextSpan(
                                  text: termAndCondition,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontSize: 16.0,
                                    color: redColor,
                                  )),
                              TextSpan(
                                  text: "&",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontSize: 16.0,
                                    color: fontGrey,
                                  )),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    fontSize: 16.0,
                                    color: redColor,
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  10.heightBox,
                  ourButton(
                          color: isCheck == true? redColor : lightGrey, 
                          title: sigNup,
                          txtColor: whiteColor,
                          onPress: () {})
                      .box
                      .width(context.screenWidth - 50)
                      .make(),
                  10.heightBox,
                  //Wapping into gesture detector of velocity X
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(
                            fontFamily: bold,
                            color: fontGrey,
                          ),
                        ),
                        TextSpan(
                          text: login,
                          style: TextStyle(
                            fontFamily: bold,
                            color: redColor,
                          ),
                        ),
                      ],
                    ),
                  ).onTap(() {
                    Get.back();
                  }),
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
      ),
    ));
  }
}
