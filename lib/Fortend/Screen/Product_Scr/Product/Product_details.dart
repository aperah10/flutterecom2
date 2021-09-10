import 'package:flutter/material.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/Drop_Down_C.dart';
import 'package:secd_ecom/Fortend/CusField/Image_C.dart';
import 'package:secd_ecom/Fortend/CusField/Text_C.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';

class ProductDetailScr extends StatelessWidget {
  static final String routeName = "/product-details";
  ProductDetailScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleName: 'Account Page',
      ),
      body: SafeArea(
          bottom: false,
          left: true,
          right: true,
          top: false,
          child: ProductDetailOne()),
    );
  }
}

class ProductDetailOne extends StatelessWidget {
  const ProductDetailOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // fit: StackFit.expand,
        children: <Widget>[
          // ! 1. PRODUCT PIC
          SinglePic(),

          // ! 2.  TITLE
          TxtTitle(titleName: 'Title'),
          TxtContent(
            contName: '500',
          ),
          // ! 2.1 DROPDOWN_MENU_ITEM
          TxtTitle(titleName: 'Varitaion'),
          DropDownBtn(),

          // ! 3.  DESCRIPTION
          TxtTitle(titleName: "Description"),
          TxtContent(
            contName:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
          ),
          TxtTitle(titleName: "Description"),
          TxtContent(
            contName:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
          ),
          TxtTitle(titleName: "Description"),
          TxtContent(
            contName:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
          ),
          TxtTitle(titleName: "Description"),
          TxtContent(
            contName:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
          ),
          // ! 4. RATINGS , Reviews , Comments .......
          InformationBtn(),
          // ! 5. BUTTONS FOR CART AND BUYNOW
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            MultipleBtn(
              btnName: 'Add to Cart',
            ),
            MultipleBtn(
              btnName: 'BuyNow',
            ),
          ])
        ],
      ),
    );
  }
}
