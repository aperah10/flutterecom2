import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:secd_ecom/Backend/Models/Cart/New_Cartm.dart';
import 'package:secd_ecom/Backend/Models/Prof_Address/Addressm.dart';
import 'package:secd_ecom/Backend/Respo/Prof_Address/AddressRespo.dart';
import 'package:secd_ecom/Backend/Respo/RCLS/Cart/CartRespo.dart';

part 'cartp_event.dart';
part 'cartp_state.dart';

class CartpBloc extends Bloc<CartpEvent, CartpState> {
  // final CartDataRespo cartRespo;
  // ! Adding Repo for data logic
  CartDataRespo cartRespo = CartDataRespo();
  AddressDataRespo addRespo = AddressDataRespo();

  CartpBloc(
      // {required this.cartRespo,}
      )
      : super(CartpInitial());

  @override
  Stream<CartpState> mapEventToState(
    CartpEvent event,
  ) async* {
    if (event is FetchCartEvent) {
      yield CartLoadingState();
      try {
        // dynamic token = storage.getItem('token');
        // print('bloc toekn $token');
        List<Address> addressData = await addRespo.getAddressData();
        List<NewCart> cartData = await cartRespo.getCartData();
        print('bloc cartData $cartData');
        yield CartLoadedState(cartData: cartData, addressData: addressData);
      } catch (e) {
        yield CartErrorState(message: e.toString());
      }
    }

    /* -------------------------------------------------------------------------- */
    /*                           // ! CART ITEM DELTING                           */
    /* -------------------------------------------------------------------------- */
    if (event is ItemDeleteCartEvent) {
      print('ProdDeleteCartEvent Happend');
      List<NewCart> prodList = await cartRespo.delCartData(
        product_id: event.product_id,
      );
      print('RESULT  OF ADDTOCART :- $prodList');
      yield ItemDeletingCartState(cartItems: prodList);
    }
  }
}
