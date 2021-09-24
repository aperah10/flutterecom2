import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:secd_ecom/Backend/Models/Cart/New_Cartm.dart';
import 'package:secd_ecom/Backend/Models/Product/New_Product_m.dart';
import 'package:secd_ecom/Backend/Models/Prof_Address/Addressm.dart';
import 'package:secd_ecom/Backend/Respo/Product/ProdRespo.dart';
import 'package:secd_ecom/Backend/Respo/Prof_Address/AddressRespo.dart';
import 'package:secd_ecom/Backend/Respo/RCLS/Cart/CartRespo.dart';

part 'prodwithcart_event.dart';
part 'prodwithcart_state.dart';

class ProdwithcartBloc extends Bloc<ProdwithcartEvent, ProdwithcartState> {
  // ! Adding Repo for data logic
  CartDataRespo cartRespo = CartDataRespo();
  ProductDataRespo prodRespo = ProductDataRespo();
  AddressDataRespo addRespo = AddressDataRespo();

  ProdwithcartBloc() : super(ProdwithcartInitial());

  @override
  Stream<ProdwithcartState> mapEventToState(
    ProdwithcartEvent event,
  ) async* {
    // ! FIRST STATE /EVENT FOR FETECH DATA
    if (event is FetchProductEvent) {
      yield ProductCartLoadingState();

      try {
        List<ProductC> productData = await prodRespo.getProduct();
        List<NewCart> cartData = await cartRespo.getCartData();
        List<Address> addressData = await addRespo.getAddressData();
        // print('-----------------------------------------------------------');
        // print(productData.any((e) => e.title!.contains('p1')));
        // print(cartData.any((e) => e.product!.id!.contains('p1')));
        // print(productData.every((e) => e.title!.contains('Mobile')));
        //  ! UNIQU VALUE IN LIST
        // var dup = [];
        // for (var p in productData) {
        //   dup.add(p.category!);
        // }

        // print(dup);
        // dup = dup.toSet().toList();
        // print(dup);

        yield ProductCartLoadedState(
            productData: productData,
            cartData: cartData,
            addressData: addressData);
      } catch (e) {
        yield ProductCartErrorState(message: e.toString());
      }
    }

    /* -------------------------------------------------------------------------- */
    /*                  // ! CART ADDED , ADDING  , DELETING BLOC                 */
    /* -------------------------------------------------------------------------- */
    if (event is ProdAddingCartEvent) {
      // print('ProdAddingCartEvent Happend');

      //  List<NewCart> cartData = await cartRespo.getCartData();
      yield ProdAddingCartState(cartItems: event.cartItems);
    }

    if (event is ProdAddedCartEvent) {
      // print('ProdAddedCartEvent Happend');

      // print(event.quantity);
      // bool prodid = await cartRespo.addCartData(
      //     product_id: event.product_id, quantity: event.quantity);
      List<NewCart> prodList = await cartRespo.addCartData(
          product_id: event.product_id, quantity: event.quantity);
      // print('RESULT  OF ADDTOCART :- $prodList');
      yield ProdAddedCartState(cartItems: prodList);
    }
    if (event is ProdDeleteCartEvent) {
      print('ProdDeleteCartEvent Happend');
      List<NewCart> prodList = await cartRespo.delCartData(
        product_id: event.product_id,
      );
      print('RESULT  OF ADDTOCART :- $prodList');
      yield ProdDeletingCartState(cartItems: prodList);
    }
  }
}
