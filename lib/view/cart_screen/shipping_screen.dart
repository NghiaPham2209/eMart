import 'package:emart/consts/consts.dart';
import 'package:emart/widget_common/custom_textfield.dart';
import 'package:emart/widget_common/our_button.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info"
            .text
            .fontFamily(semibold)
            .color(darkFontGrey)
            .make(),
      ),
      bottomNavigationBar: SizedBox(
        child: ourButton(
          color: redColor,
          onPress: () {},
          txtColor: whiteColor,
          title: "Continue",
        ),
      ),
      body: Column(
        children: [
          customerTextField(hint: "Address", isPass: false, title: "Address"),
          customerTextField(hint: "City", isPass: false, title: "City"),
          customerTextField(hint: "State", isPass: false, title: "State"),
          customerTextField(hint: "Postal Code", isPass: false, title: "Postal Code"),
          customerTextField(hint: "Phone", isPass: false, title: "Phone"),
        ],
      ),
    );
  }
}
