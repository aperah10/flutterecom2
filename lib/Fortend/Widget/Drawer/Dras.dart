import 'package:flutter/material.dart';
import 'package:secd_ecom/Fortend/CusField/Aviatar_Pic.dart';
import 'package:secd_ecom/Fortend/Screen/Order/Order2.dart';
import 'package:secd_ecom/Fortend/Screen/Order/Order_Scr.dart';
import 'package:secd_ecom/Fortend/Screen/Order/Payment.dart';
import 'package:secd_ecom/Fortend/Screen/Order/payment2.dart';
import 'package:secd_ecom/Fortend/Screen/Product_Scr/Cart/Cart.dart';
import 'package:secd_ecom/Fortend/Screen/Product_Scr/Product/Product_Cat.dart';
import 'package:secd_ecom/Fortend/Screen/Product_Scr/Search/SearchProduct.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Profile/Acc_P.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Profile/Edit_P.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Profile/Profile.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Profile/ProfileM.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Profile/ShowP.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({Key? key}) : super(key: key);

  @override
  _MyDrawerListState createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        //  orc Custom Header file
        // CusDrawerHeader(),
        CusAvaitar2(),
        //  ! END  Custom Header file

        // ! CUSTOM DRAWER LIST ITEM
        CusDrawerList(
            title: 'Product Grid Show',
            icon: Icons.price_check,
            createPage: () => ProductGridScr()),
        CusDrawerList(
            title: ' Cart',
            icon: Icons.shopping_bag,
            createPage: () => CartScr()),
        CusDrawerList(
            title: ' Search',
            icon: Icons.search,
            createPage: () => SerachScr()),
        CusDrawerList(
            title: ' Acccount',
            icon: Icons.account_balance,
            createPage: () => AccountScr()),
        CusDrawerList(
            title: 'ProfileMix',
            icon: Icons.photo,
            createPage: () => ProfileScr()),
        CusDrawerList(
            title: 'ProfileEdit',
            icon: Icons.photo,
            createPage: () => ProfileEditScr()),
        CusDrawerList(
            title: 'ProfileShow',
            icon: Icons.photo,
            createPage: () => ProfileShowScr()),

        // CusDrawerList(
        //     title: ' Order Page',
        //     icon: Icons.add_a_photo_rounded,
        //     createPage: () => ConfirmOrderPage()),
        // CusDrawerList(
        //     title: ' Order 2',
        //     icon: Icons.one_k_rounded,
        //     createPage: () => MyOrdersScreen()),
        // CusDrawerList(
        //     title: ' Payment page',
        //     icon: Icons.payment,
        //     createPage: () => PaymentPage()),
        // CusDrawerList(
        //     title: ' Payment page 2',
        //     icon: Icons.payment,
        //     createPage: () => PaymentScreen()),
      ])),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                          // !P:- 1. CUSTOM DRAWER HEADER                         */
/* -------------------------------------------------------------------------- */
class CusDrawerHeader extends StatelessWidget {
  CusDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Image.asset(
                '',
                width: 130,
                height: 130,
              ),
            ),
          ),
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Rahul",
                  style: TextStyle(
                      color: Color(0xFF545454),
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}

/* -------------------------------------------------------------------------- */
/*               // ! P:-2. CUSTOM DRAWER LIST VIEW DATA                     */
/* -------------------------------------------------------------------------- */

class CusDrawerList extends StatelessWidget {
  Widget Function() createPage;
  // dynamic sendPage;
  String title;
  IconData icon;

  CusDrawerList({
    Key? key,
    required this.title,
    required this.icon,
    required this.createPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return createPage();
          }));
        },
        child: ListTile(
          title: Text(title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          leading: Icon(icon),
        ));
  }
}
