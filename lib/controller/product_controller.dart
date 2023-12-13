import 'package:emart/consts/consts.dart';
import 'package:emart/model/categories_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var subcat = [];
  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoriesModelFromJson(data);
    var subC =
        decoded.categories.where((element) => element.name == title).toList();

    for (var i in subC[0].subcategory) {
      subcat.add(i);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQuantity(totalQuantity, BuildContext context) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    } else {
      VxToast.show(context,
          msg: "We don't have enough stock for you!", textColor: redColor);
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart({title, img, sellerName, color, qty, totalPrice, context}) async {
    await firestore.collection(cartCollection).doc().set({
      "title": title,
      "image": img,
      "sellerName": sellerName,
      "color": color,
      "quantity": qty,
      "totalPrice": totalPrice,
      "added_by": currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValue() {
    totalPrice.value = 0;
    quantity.value = 0;
    colorIndex.value = 0;
  }
}
