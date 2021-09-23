import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:secd_ecom/Backend/Respo/Product/ProdRespo.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/Image_C.dart';
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
        // print('THis is ProductAdded State ${state.cartItems}');
        Navigator.of(context).pushReplacementNamed(ProductGridScr.routeName);
      }
    }, builder: (context, state) {
      // print("produc page state: $state");
      if (state is ProductCartLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is ProductCartErrorState) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Login Failure'), Icon(Icons.error)],
              ),
              backgroundColor: Colors.red,
            ),
          );
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
              cartNumber: cartState,
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
  List? cartNumber;
  ProdGridListShow({Key? key, this.prodNumber, this.cartNumber})
      : super(key: key);

  // cartFun() {
  //   for (var p in cartNumber) {
  //     print(p);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 180.0,
        child: Wrap(
          children: <Widget>[
            // Image.network(prodNumber.pic == null ? '' : prodNumber.pic),
            // ! PRODUCT PIC
            MultiplePic(prodNumber.pic == null ? '' : prodNumber.pic),
            // ! END PRODUCT PIC
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // ! add PRODUCT ITEM DEIALS
                            ProductDetailScr(
                                prodNumber: prodNumber,
                                cartNumber: cartNumber)));
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
                MultipleBtn(
                  btnName: cartNumber!.any((e) => e.product!.id!
                              .contains(prodNumber.id.toString())) ==
                          false
                      ? 'acart'
                      : 'gcart',
                  submitMethod: () {
                    // ! PRODUCT DOES'NT EXIST IN CART
                    if (cartNumber!.any((e) => e.product!.id!
                            .contains(prodNumber.id.toString())) ==
                        false) {
                      BlocProvider.of<ProdwithcartBloc>(context)
                        ..add(ProdAddedCartEvent(
                            product_id: prodNumber.id, quantity: 1));
                    } // ! PRODUCT  EXIST IN CART
                    else {
                      Navigator.of(context)
                          .pushReplacementNamed(CartScr.routeName);
                    }
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
