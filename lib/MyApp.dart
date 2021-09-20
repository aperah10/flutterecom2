import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:secd_ecom/Fortend/Screen/Product_Scr/Cart/Cart.dart';

import 'Backend/Models/Prof_Address/Profilem.dart';
import 'Fortend/Screen/Authr_Scr/HomeScr.dart';
import 'Fortend/Screen/Authr_Scr/Login.dart';
import 'Fortend/Screen/Authr_Scr/Register.dart';
import 'Fortend/Screen/Product_Scr/Product/Product_Cat.dart';
import 'Fortend/Screen/Product_Scr/Product/Product_details.dart';

import 'Fortend/Screen/Prof_Address_Scr/Address/Create_Address.dart';
import 'Fortend/Screen/Prof_Address_Scr/Address/Show_Address.dart';
import 'Fortend/Screen/Prof_Address_Scr/Address/Up_address.dart';
import 'Fortend/Screen/Prof_Address_Scr/Profile/Edit_P.dart';
import 'Fortend/Screen/Prof_Address_Scr/Profile/ShowP.dart';
import 'ZExtra/AllproviderList.dart';

class MyApp extends StatelessWidget {
  // final CustomUserLoginRespo userRepository;

  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = new LocalStorage('usertoken');

    return MultiProvider(
      providers: MainBloc.allBlocs(),
      child: MaterialApp(
        builder: (context, widget) => ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            defaultScale: true,
            minWidth: 480,
            // defaultName: DESKTOP,
            breakpoints: [
              ResponsiveBreakpoint.autoScale(480, name: MOBILE),
              ResponsiveBreakpoint.resize(600, name: MOBILE),
              ResponsiveBreakpoint.resize(850, name: TABLET),
              ResponsiveBreakpoint.resize(1080, name: DESKTOP),
            ],
            background: Container(color: Color(0xFFF5F5F5))),
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: storage.ready,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (storage.getItem('token') == null) {
              return LoginScr();
            }
            // print('storage token:-  $storage');
            // return CartScrOne();
            // return ProductDetailScr();
            return HomeScr();
          },
        ),
        routes: {
          HomeScr.routeName: (ctx) => HomeScr(),
          LoginScr.routeName: (ctx) => LoginScr(),
          RegisterScr.routeName: (ctx) => RegisterScr(),

          ProductGridScr.routeName: (ctx) => ProductGridScr(),
          CartScr.routeName: (ctx) => CartScr(),
          ProfileShowScr.routeName: (ctx) => ProfileShowScr(),
          AddressShowScr.routeName: (ctx) => AddressShowScr(),
          AddressPostScr.routeName: (ctx) => AddressPostScr(),
          ProfileEditScr.routeName: (ctx) => ProfileEditScr(),
          AddressUpScr.routeName: (ctx) => AddressUpScr(),
          // ProductGridView.routeName: (ctx) => ProductGridView(),
          // ProductListView.routeName: (ctx) => ProductListView(),
          // CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
