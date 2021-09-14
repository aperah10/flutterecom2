import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/Drop_Down_C.dart';
import 'package:secd_ecom/Fortend/CusField/Image_C.dart';
import 'package:secd_ecom/Fortend/CusField/Text_C.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';

class ProductDetailScr extends StatelessWidget {
  dynamic prodNumber;
  static final String routeName = "/product-details";
  ProductDetailScr({Key? key, this.prodNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProdwithcartBloc, ProdwithcartState>(
      listener: (context, state) {},
      child: BlocBuilder<ProdwithcartBloc, ProdwithcartState>(
          builder: (context, state) {
        // if (state is ItemAddingCartState) {
        //   cartItems = state.cartItems;
        // }
        return Scaffold(
          appBar: CustomAppBar(
            titleName: 'Account Page',
          ),
          body: SafeArea(
              bottom: false,
              left: true,
              right: true,
              top: false,
              child: ProductDetailOne(prodNumber: prodNumber)),
        );
      }),
    );
  }
}

class ProductDetailOne extends StatelessWidget {
  dynamic prodNumber;
  ProductDetailOne({Key? key, this.prodNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(' this is ProductAdded :- $prodNumber');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // fit: StackFit.expand,
        children: <Widget>[
          // ! 1. PRODUCT PIC
          SinglePic(
            prodNumber.pic == null ? '' : prodNumber.pic,
          ),

          // ! 2.  TITLE
          TxtTitle('Title'),
          TxtContent(
            prodNumber.discountPrice.toString(),
          ),
          // ! 2.1 DROPDOWN_MENU_ITEM
          TxtTitle('Varitaion'),
          DropDownBtn(),

          // ! 3.  DESCRIPTION
          TxtTitle("Description"),
          TxtContent(
            prodNumber.description,
          ),
          TxtTitle("Description"),
          TxtContent(
            prodNumber.description,
          ),
          TxtTitle("Description"),
          TxtContent(
            prodNumber.description,
          ),
          TxtTitle("Description"),
          TxtContent(
            prodNumber.description,
          ),
          // ! 4. RATINGS , Reviews , Comments .......
          InformationBtn(),
          // ! 5. BUTTONS FOR CART AND BUYNOW
          Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
            MultipleBtn(
                btnName: 'Add to Cart',
                submitMethod: () {
                  // !   PRODUCT page send data in cart
                  BlocProvider.of<ProdwithcartBloc>(context)
                    ..add(ProdAddedCartEvent(product_id: prodNumber.id));
                }),
            MultipleBtn(
              btnName: 'BuyNow',
            ),
          ])
        ],
      ),
    );
  }
}
