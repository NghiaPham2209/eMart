import 'dart:io';
import 'package:emart/view/profile_screen/profile_controller.dart';
import 'package:emart/widget_common/bg_widget.dart';
import 'package:emart/widget_common/custom_textfield.dart';
import 'package:emart/widget_common/our_button.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 150,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImgPath.value),
                        width: 150,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(
                    color: redColor,
                    onPress: () {
                      controller.changeImage(context);
                    },
                    txtColor: whiteColor,
                    title: "Change Image"),
                const Divider(),
                10.heightBox,
                customerTextField(
                    hint: nameHint,
                    title: name,
                    isPass: false,
                    controller: controller.nameController),
                customerTextField(
                    hint: password,
                    title: password,
                    isPass: true,
                    controller: controller.passwordController),
                20.heightBox,
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: context.screenWidth - 60,
                        child: ourButton(
                            color: redColor,
                            onPress: () async {
                              controller.isLoading(true);
                              await controller.uploadProfileImage();
                              await controller.updateProfile(
                                imgUrl: controller.profileImageLink,
                                name: controller.nameController.text,
                                password: controller.passwordController.text,
                              );
                              VxToast.show(context, msg: "Update Successfully");
                            },
                            txtColor: whiteColor,
                            title: "Save Profile"),
                      ),
              ],
            )
                .box
                .white
                .shadowSm
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
                .rounded
                .make(),
          ),
        ),
      ),
    );
  }
}
