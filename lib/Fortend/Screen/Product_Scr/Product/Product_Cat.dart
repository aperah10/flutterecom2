import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:secd_ecom/Backend/Respo/Product/ProdRespo.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/Screen/Product_Scr/Cart/Cart.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';

import 'Product_details.dart';

class ProductGridScr extends StatefulWidget {
  static const routeName = '/grid-product-screens';
  ProductGridScr({Key? key}) : super(key: key);

  @override
  _ProductGridScrState createState() => _ProductGridScrState();
}

class _ProductGridScrState extends State<ProductGridScr> {
//  ! PRODUCT BLOC INSTANCE
  ProdwithcartBloc prodBloc = ProdwithcartBloc();

  @override
  void initState() {
    prodBloc = BlocProvider.of<ProdwithcartBloc>(context);
    prodBloc.add(FetchProductEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProdwithcartBloc, ProdwithcartState>(
        listener: (context, state) {
      if (state is ProdAddedCartState) {
        print('THis is ProductAdded State ${state.cartItems}');
        Scaffold(body: Center(child: Text('PRODUCT ADDED IN CART')));
      }
    }, builder: (context, state) {
      print("produc page state: $state");
      if (state is ProductCartLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is ProductCartErrorState) {
        return Center(child: Text(' this is eror ${state.message}'));
      }
      if (state is ProductCartLoadedState) {
        return ProdScrOne(
          cartState: state.cartData,
          prodState: state.productData,
        );
      }
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    });
  }
}

/* -------------------------------------------------------------------------- */
/*                        // ! EXTRA CLASS FOR PRODUCT                        */
/* -------------------------------------------------------------------------- */
class ProdScrOne extends StatelessWidget {
  dynamic cartState;
  dynamic prodState;
  ProdScrOne({Key? key, this.prodState, this.cartState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(titleName: 'ProductPage'),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<ProdwithcartBloc>(context),
                        child: CartScr())));
          },
          child: Text(
            cartState.length.toString(),
          ),
        ),
        body: SafeArea(
          bottom: false,
          left: true,
          right: true,
          top: false,
          child: ProdGridList(
            prodState: prodState,
            cartState: cartState,
          ),
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                           // ! PRODUCT GRID  LIST                          */
/* -------------------------------------------------------------------------- */
class ProdGridList extends StatelessWidget {
  dynamic cartState;
  dynamic prodState;
  ProdGridList({Key? key, this.prodState, this.cartState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: prodState.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.60,
            // crossAxisSpacing: 20,
            //   mainAxisSpacing: 20
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          itemBuilder: (context, index) {
            // print(cartState.length);
            return ProdGridListShow(
              prodNumber: prodState[index],
              // cartNumber: cartState,
            );
          }),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                         // ! PRODUCT GRID LIST SHOW                        */
/* -------------------------------------------------------------------------- */
class ProdGridListShow extends StatelessWidget {
  dynamic prodNumber;
  dynamic cartNumber;
  ProdGridListShow({Key? key, this.prodNumber, this.cartNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 180.0,
        child: Wrap(
          children: <Widget>[
            Image.asset(prodNumber.pic == null ? '' : prodNumber.pic),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // ! add PRODUCT ITEM DEIALS
                            ProductDetailScr(prodNumber: prodNumber)));
              },
              title: Text(
                prodNumber.title,
                // title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                prodNumber.description,
                // subTitle,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // SingleBtn(btnName: 'Save')
                MultipleBtn(
                  btnName: 'a' == 'a' ? "gcart" : 'acart',
                  submitMethod: () {
                    BlocProvider.of<ProdwithcartBloc>(context)
                      ..add(ProdAddedCartEvent(
                          product_id: prodNumber.id, quantity: 999));
                  },
                ),
                MultipleBtn(btnName: 'Buy', submitMethod: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
