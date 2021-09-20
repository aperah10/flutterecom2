import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:secd_ecom/Backend/Models/Prof_Address/Addressm.dart';
import 'package:secd_ecom/Backend/Respo/Prof_Address/AddressRespo.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  //  orc Adding Repo for data logic

  AddressDataRespo addRespo = AddressDataRespo();

  AddressBloc() : super(AddressInitial());

  @override
  Stream<AddressState> mapEventToState(
    AddressEvent event,
  ) async* {
    // ! FIRST STATE /EVENT FOR FETECH DATA
    if (event is FetchAddressEvent) {
      yield AddressLoadingState();

      try {
        List<Address> addressData = await addRespo.getAddressData();

        // print('-----------------------------------------------------------');
        print('profData:- $addressData ');
        // print('cartData:- $cartData ');
        yield AddressLoadedState(
          addressData: addressData,
        );
      } catch (e) {
        yield AddressErrorState(error: e.toString());
      }
    }

    /* -------------------------------------------------------------------------- */
    /*                  // ! Address ADDED , ADDING  , DELETING BLOC                 */
    /* -------------------------------------------------------------------------- */
    if (event is AddressSaveButtonEvent) {
      //   // print('ProdAddedCartEvent Happend');
      List<Address> addrList = await addRespo.addAddressData(
          fullname: event.fullname,
          email: event.email,
          phone: event.phone,
          house: event.house,
          trade: event.trade,
          area: event.area,
          city: event.city,
          pinCode: event.pinCode,
          delTime: event.delTime,
          state: event.state);

      // print('RESULT  OF ADDTOCART :- $prodList');
      yield AddressSuccessState();
    }

    /* -------------------------------------------------------------------------- */
    /*                  // ! Address UPDATE  , DELETING BLOC                 */
    /* -------------------------------------------------------------------------- */
    if (event is AddressUpBtnEvent) {
      //   // print('ProdAddedCartEvent Happend');
      List<Address> addrList = await addRespo.upAddressData(
          fullname: event.fullname,
          email: event.email,
          phone: event.phone,
          house: event.house,
          trade: event.trade,
          area: event.area,
          city: event.city,
          pinCode: event.pinCode,
          delTime: event.delTime,
          state: event.state);

      // print('RESULT  OF ADDTOCART :- $prodList');
      yield AddressSuccessState();
    }
  }
}
