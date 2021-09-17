import 'dart:js';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Authr/Login/userlogin_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Authr/Register/register_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Authr/auth/userauthenticate_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Address/address_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Profile/profile_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Product/Search_Product/searchproduct_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/RCLS/Cart/cartp_bloc.dart';
import 'package:secd_ecom/Backend/Respo/Authr/new_auth_respo/new_custlogin_respo.dart';
import 'package:secd_ecom/Fortend/CusField/Form/formValdation.dart';

class MainBloc {
  static List<SingleChildWidget> allBlocs() {
    return [
      ChangeNotifierProvider(create: (ctx) => NewCustomUserLoginRespo()),
      ChangeNotifierProvider(create: (ctx) => AllFormValdation()),
      BlocProvider(create: (ctx) => UserauthenticateBloc()),
      BlocProvider(create: (ctx) => RegisterBloc()),
      BlocProvider(create: (ctx) => UserloginBloc()),
      // BlocProvider(
      //     create: (ctx) => ProductshowBloc(prodRespo: ProductDataRespo())),
      // BlocProvider(
      //     create: (ctx) =>
      //         SearchproductBloc(searchRepository: SearchPDataRespo())),
      // BlocProvider(
      //     create: (ctx) =>
      //         CartpBloc(cartRespo: CartDataRespo(), )),
      // BlocProvider(create: (context) => ShopBloc()),
      BlocProvider(create: (context) => ProdwithcartBloc()),
      BlocProvider(create: (ctx) => CartpBloc()),
      BlocProvider(create: (ctx) => SearchproductBloc()),
      BlocProvider(create: (ctx) => ProfileBloc()),
      BlocProvider(create: (ctx) => AddressBloc()),
    ];
  }
}
