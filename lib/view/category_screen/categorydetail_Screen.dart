import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/controller/product_controller.dart';
import 'package:emart/services/filestore_services.dart';
import 'package:emart/view/category_screen/item_detail_screen.dart';
import 'package:emart/widget_common/loading_indicator.dart';
import 'package:get/get.dart';

import '../../widget_common/bg_widget.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
        ),
        body: StreamBuilder(
          stream: FireStoreService.getProduct(title),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "No Product Found!".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;
              return Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.subcat.length,
                          (index) => "${controller.subcat[index]}"
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .rounded
                              .size(120, 60)
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
                          itemCount: data.length,
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
                                Image.network(
                                  data[index]['p_imgs'][1],
                                  width: 200,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
                                "${data[index]['p_name']}"
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "${data[index]['p_price']}"
                                    .numCurrency
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
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .padding(const EdgeInsets.all(12))
                                .make()
                                .onTap(() {
                              controller.checkIfFav(data[index]);
                              Get.to(() => ItemDetail(
                                    title: "${data[index]['p_name']}",
                                    data: data[index],
                                  ));
                            });
                          }),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
