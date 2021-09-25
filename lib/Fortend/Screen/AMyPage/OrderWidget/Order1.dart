import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Order/bloc/orderpage_bloc.dart';
import 'package:secd_ecom/Backend/Models/Cart/New_Cartm.dart';

// ! ORDER PRODUCT_TO_JSON

class OrderWithCart extends StatefulWidget {
  dynamic cartList;
  dynamic adrData;

  OrderWithCart({Key? key, this.adrData, this.cartList}) : super(key: key);

  @override
  _OrderWithCartState createState() => _OrderWithCartState();
}

class _OrderWithCartState extends State<OrderWithCart> {
  final formKey = GlobalKey<FormState>();
  List<CartItem> cartSaved = [];

  _orderBtn() async {
    var isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return "Enter the Correct Value";
    }
    formKey.currentState!.save();

    print('save for key');
    // print(quantityP);

    print(cartSaved.length);

    for (var v in cartSaved) {
      // print(v.productId);
      // print(v.quantity);
      BlocProvider.of<OrderpageBloc>(context)
        ..add(OrderBtnPressed(
            address: widget.adrData[0].id,
            product: v.productId,
            quantity: v.quantity));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo")),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //  ! Address Data in this is page
              Card(
                  child: Column(
                children: [
                  Text('Address'),
                  Text('${widget.adrData[0].fullname}'),
                  Text('${widget.adrData[0].phone}'),
                  Text('${widget.adrData[0].pinCode}'),
                  Text('${widget.cartList[0].product.id}'),
                  InkWell(
                    child: Text('Change or Add Address'),
                  )
                ],
              )),

              // ! Product List Data
              Form(
                key: formKey,
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.cartList.length,
                      itemBuilder: (context, index) {
                        if (widget.cartList.isEmpty) {
                          return CircularProgressIndicator();
                        } else {
                          return ListTile(
                            title: Card(
                              child: Column(
                                children: [
                                  Text(
                                      '${widget.cartList[index].product.title} '),
                                  Text(
                                      '${widget.cartList[index].product.description} '),
                                ],
                              ),
                            ),
                            subtitle: singleItem(widget.cartList[index]),
                          );
                        }
                      }),
                ),
              ),

              // ! btn for save data logic
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                    onTap: () {
                      _orderBtn();
                      cartSaved.clear();
                    },
                    child: Text(
                      'Order',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget singleItem(dynamic cartNum) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: cartNum.quantity.toString(),
            onSaved: (String? val) {
              print(val);

              CartItem cartI = CartItem(
                  productId: cartNum.product.id, quantity: int.parse(val!));
              cartSaved.add(cartI);
            },
            decoration: InputDecoration(
              labelText: "Qty",
            ),
          ),
        ],
      ),
    );
  }
}

// ! only for save data logic
class CartItem {
  final String productId;
  final int quantity;

  CartItem({required this.productId, required this.quantity});
}
