import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/controller/home_controller.dart';
import 'package:emart/view/home_screen/home_screen.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // create element ID random
  String randomCode = List.generate(9, (index) => Random().nextInt(10)).join();

  var totalP = 0.obs;

  // text controller for shipping details
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalCodeController = TextEditingController();
  var phoneController = TextEditingController();

  var paymentIndex = 0.obs;

  late dynamic productSnapshot;
  var products = [];

  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['totalPrice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder(
      {required oderPaymentMethod, required totalAmount, context}) async {
    await getProductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code': randomCode,
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currentUser!.uid,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email': currentUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_postalCode': postalCodeController.text,
      'order_by_phone': phoneController.text,
      'shipping_method': "Home Delivery",
      'payment_method': oderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'order': FieldValue.arrayUnion(products),
    });
    VxToast.show(context, msg: "Payment Successfully");
    // Get.offAll(() => const HomeScreen());
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color': productSnapshot[i]['color'],
        'image': productSnapshot[i]['image'],
        'quantity': productSnapshot[i]['quantity'],
        'title': productSnapshot[i]['title'],
      });
    }
  }
}
