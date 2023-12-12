import 'package:emart/model/categories_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var subcat = [];

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
}
