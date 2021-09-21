import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Product/ProdwithCart/prodwithcart_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/RCLS/Cart/cartp_bloc.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/Image_C.dart';
import 'package:secd_ecom/Fortend/CusField/Iocns_C.dart';
import 'package:secd_ecom/Fortend/CusField/Text_C.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:secd_ecom/Fortend/Widget/Border/round_border.dart';

class CartScr extends StatefulWidget {
  static const routeName = '/cart-screens';
  CartScr({Key? key}) : super(key: key);

  @override
  _CartScrState createState() => _CartScrState();
}

class _CartScrState extends State<CartScr> {
  // CartpBloc cartBloc = CartpBloc(cartRespo: CartDataRespo(), storage: storage);
  CartpBloc cartBloc = CartpBloc();

  // ! LOAD INIT STATE IS CART PAGE
  @override
  void initState() {
    cartBloc = BlocProvider.of<CartpBloc>(context);
    cartBloc.add(FetchCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartpBloc, CartpState>(listener: (context, state) {
      if (state is ItemDeletingCartState) {
        Navigator.of(context).pushReplacementNamed(CartScr.routeName);
      }
    }, builder: (context, state) {
      // print("produc page state: $state");
      if (state is CartLoadingState) {
        return Center(child: CircularProgressIndicator());
      }
      if (state is CartErrorState) {
        return Center(child: Text(' this is eror ${state.message}'));
      }
      if (state is CartLoadedState) {
        return CartScrOne(cartData: state.cartData);
      }
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    });
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! CART SCREEN                              */
/* -------------------------------------------------------------------------- */

class CartScrOne extends StatelessWidget {
  dynamic cartData;
  CartScrOne({
    Key? key,
    this.cartData,
  }) : super(key: key);

  @override
  // final cartData = List.generate(
  //     20, (index) => {"index": 1, "title": "mango", "price": 500});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: 'Cart'),
      body: SafeArea(
          child: cartData.isNotEmpty
              ? Container(
                  child: Column(children: <Widget>[
                  // ! LISTVIEW BUIDER
                  Flexible(
                    child: ListView.builder(
                        itemCount: cartData.length,
                        itemBuilder: (context, index) {
                          // print(index);
                          return CartListScr(cartNumber: cartData[index]);
                          // return CartListScr(cartNumber: cartData[index]);
                        }),
                  ),
                  // ! CHECKOUT BTN
                  CartCheckBtn()
                ]))
              : Center(child: Text('No product in Cart'))),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                            // ! CHECKOUT SCREEN                            */
/* -------------------------------------------------------------------------- */
class CartCheckBtn extends StatelessWidget {
  const CartCheckBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black12,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // ! TOATAL PRICE DATA
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    TxtTitle(
                      "Checkout Price:",
                    ),
                    Spacer(),
                    Text(
                      "Rs. 5000",
                    ),
                  ],
                ),
              ),
              //  ! 2
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    TxtTitle(
                      "Checkout Price:",
                    ),
                    Spacer(),
                    Text(
                      "Rs. 5000",
                    ),
                  ],
                ),
              ),

              // ! CHECKOUT BTN
              SingleBtn(
                btnName: "Continue",
              )
            ]));
  }
}

/* -------------------------------------------------------------------------- */
/*                            // !CART LIST SCREEN                            */
/* -------------------------------------------------------------------------- */
class CartListScr extends StatelessWidget {
  dynamic cartNumber;
  CartListScr({Key? key, this.cartNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.all(2.0),
      margin: EdgeInsets.all(2),
      height: 200,
      width: 300,
      child: Row(children: <Widget>[
        // ! 1  Product PIC
        // CartPic(cartNumber.product.pic),
        Container(
          width: 150,
          height: 150,
          child: Image.network(
            cartNumber.product.pic == null ? '' : cartNumber.product.pic,
            width: 30.0,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),

        // !2. CART DATA
        Flexible(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: <Widget>[
                  // ! 2.1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: TxtTitle(cartNumber.product.title),
                      ),
                      // ! 2.1.1
                      IconBtn(Icons.delete, submitMethod: () {
                        // ! CART ITEM DELETE
                        BlocProvider.of<CartpBloc>(context)
                          ..add(ItemDeleteCartEvent(
                              product_id: cartNumber.product.id.toString()));
                        // BlocProvider.of<ProdwithcartBloc>(context)
                        //   ..add(ProdDeleteCartEvent(
                        //       product_id: cartNumber.product.id.toString()));
                        // ! END CART ITEM METHOD
                      }),
                    ],
                  ),
                  // ! 2.2 data
                  Row(
                    children: [
                      TxtTitle("Price: "),
                      SizedBox(
                        width: 5,
                      ),
                      SubTxtTitle(
                        cartNumber.product.discountPrice.toString(),
                      )
                      // Text(
                      //   '\$200',
                      //   style: TextStyle(
                      //       fontSize: 16, fontWeight: FontWeight.w300),
                      // )
                    ],
                  ),
                  // ! 2.3 DATA

                  Row(
                    children: <Widget>[
                      TxtTitle("Sub Total: "),
                      SizedBox(
                        width: 5,
                      ),
                      SubTxtTitle(
                        'Rs ${cartNumber.quantity * cartNumber.product.discountPrice}',
                      )
                    ],
                  ),

                  // ! 2.4 DATA

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconBtn2(icon: Icons.remove),
                      SizedBox(
                        width: 4,
                      ),
                      // ! ITEM DATA
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(cartNumber.quantity.toString()),
                        ),
                      ),
                      // ! END ITEM DATA
                      SizedBox(
                        width: 4,
                      ),
                      IconBtn2(icon: Icons.add),
                    ],
                  )
                ])))
      ]),
    );
  }
}
