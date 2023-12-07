import 'package:emart/consts/consts.dart';
import 'package:emart/view/category_screen/item_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget_common/bg_widget.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => "Baby Clothing"
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(110, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make(),
                  ),
                ),
              ),

              20.heightBox,
              //items container
              Expanded(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 250,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP6,
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          10.heightBox,
                          "Laptop 4GB/64GB"
                              .text
                              .white
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                          10.heightBox,
                          "\$600"
                              .text
                              .white
                              .fontFamily(bold)
                              .color(redColor)
                              .size(16)
                              .make(),
                        ],
                      )
                          .box
                          .white
                          .roundedSM
                          .outerShadow
                          .margin(const EdgeInsets.symmetric(horizontal: 4))
                          .padding(const EdgeInsets.all(12))
                          .make()
                          .onTap(() {
                        Get.to(() => const ItemDetail(title: "Dummy Item"));
                      });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
