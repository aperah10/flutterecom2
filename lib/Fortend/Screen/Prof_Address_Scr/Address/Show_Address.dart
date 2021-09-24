import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Address/address_bloc.dart';
import 'package:secd_ecom/Fortend/CusField/Iocns_C.dart';
import 'package:secd_ecom/Fortend/Screen/Order/MyOrder/orderWidget.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';

import 'Create_Address.dart';
import 'Up_address.dart';

class AddressShowScr extends StatelessWidget {
  static const routeName = '/showp-Addresspage in ';
  AddressShowScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: 'Address Page '),
      body: SafeArea(
        bottom: false,
        left: true,
        right: true,
        top: false,
        child: Address1(),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! Address BODY                             */
/* -------------------------------------------------------------------------- */
class Address1 extends StatefulWidget {
  Address1({
    Key? key,
  }) : super(key: key);

  @override
  _Address1State createState() => _Address1State();
}

class _Address1State extends State<Address1> {
  dynamic idtData;

  // ! Address instance
  //  ProductshowBloc prodBloc = ProductshowBloc(prodRespo: ProductDataRespo());
  AddressBloc prodBloc = AddressBloc();

  @override
  void initState() {
    prodBloc = BlocProvider.of<AddressBloc>(context);
    prodBloc.add(FetchAddressEvent());
    super.initState();
  }

  //  !   callback method for data
  callback(newAbc) {
    setState(() {
      idtData = newAbc;
      print('this is idtData in parent class ${idtData}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressBloc, AddressState>(
      listener: (context, state) {
        if (state is AddressLoadingState) {
          Center(child: CircularProgressIndicator());
        }
        if (state is AddressErrorState) {
          Center(child: Text(state.error.toString()));
        }
        // if (state is AddressLoadedState) {
        //   Center(child: Text('LISTENER:- ${state.AddressData}'));
        // }
      },
      child: BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
        if (state is AddressLoadedState) {
          // print(state.addressData);
          return AddressShow(adrState: state.addressData, callback: callback);
        }
        // if (state is AddressLoadedState) {
        //   Center(child: Text('${state.AddressData}'));
        // }

        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! ADDRESS SHOW                             */
// /* -------------------------------------------------------------------------- */

class AddressShow extends StatefulWidget {
  dynamic adrState;
  Function(String)? callback;

  AddressShow({Key? key, this.adrState, this.callback}) : super(key: key);

  @override
  _AddressShowState createState() => _AddressShowState();
}

class _AddressShowState extends State<AddressShow> {
  dynamic gValue = 0;
  dynamic idt;

  @override
  void initState() {
    idt = widget.adrState[0].id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // padding:
        //     EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! Address Header
        Container(
            color: Colors.grey.shade200,
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Delivery Address".toUpperCase()),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AddressPostScr.routeName);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),

        // ! Conatiner for listview builder
        widget.adrState.isNotEmpty
            ? Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.adrState.length,
                    itemBuilder: (context, index) {
                      return RadioListTile(
                        value: index,
                        groupValue: gValue,
                        onChanged: (ind) {
                          setState(() {
                            gValue = ind;
                            idt = widget.adrState[index].id;
                            // print('idt :- ${idt}');
                            widget.callback!(idt);
                          });
                        },
                        title: AddressDataM(adrNumber: widget.adrState[index]),
                      );
                    }),
              )
            : Center(
                child: Text('No Address'),
              )

        // // ! Address field DATA
      ],
    ));
  }
}

class AddressDataM extends StatelessWidget {
  dynamic adrNumber;

  AddressDataM({Key? key, this.adrNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! fullname
        Text(
          adrNumber.fullname != null ? adrNumber.fullname : 'Fullname',
          // title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(adrNumber.phone != null ? adrNumber.phone : 'Phone'),
        Text(adrNumber.house != null ? adrNumber.house : 'house number'),
        Text(adrNumber.trade != null ? adrNumber.trade : 'Trade'),
        Text(adrNumber.city != null ? adrNumber.city : 'City'),
        Text(adrNumber.pinCode != null ? adrNumber.pinCode : 'PostalCode'),
        Text(adrNumber.state != null ? adrNumber.state : 'State'),
        Text(adrNumber.delTime != null ? adrNumber.delTime : 'DelTime'),
      ],
    ));
  }
}

// class AddressShow extends StatelessWidget {
//   dynamic adrState;
//   dynamic gValue;
//   AddressShow({Key? key, this.adrState}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         // padding:
//         //     EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ! Address Header
//         Container(
//             color: Colors.grey.shade200,
//             padding: EdgeInsets.all(8.0),
//             width: double.infinity,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("Delivery Address".toUpperCase()),
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context)
//                         .pushReplacementNamed(AddressPostScr.routeName);
//                   },
//                   child: Text(
//                     'Add',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ],
//             )),

//         // ! Conatiner for listview builder
//         adrState.isNotEmpty
//             ? Container(
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: adrState.length,

//                     itemBuilder: (context, index) {
//                       // print(cartState.length);

//                       // return AddressGridListShow(
//                       //   adrNumber: adrState[index],
//                       //   adrState: adrState,
//                       // );
//                       return AddressRadBtn(
//                         adrNumber: adrState[index],
//                         ind: index,
//                         gValue: gValue,
//                       );
//                     }),
//               )
//             : Center(
//                 child: Text('No Address'),
//               )

//         // // ! Address field DATA
//       ],
//     ));
//   }
// }

/* -------------------------------------------------------------------------- */
/*                         // ! ADDRESS GRID LIST VIEW                        */
/* -------------------------------------------------------------------------- */
class AddressGridListShow extends StatelessWidget {
  dynamic adrNumber;
  dynamic adrState;

  AddressGridListShow({
    Key? key,
    this.adrNumber,
    this.adrState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10.0),
      child: SizedBox(
        width: 20.0,
        child: Wrap(
          children: <Widget>[
            // ! END PRODUCT PIC
            ListTile(
                onTap: () {},
                trailing: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    // ! ADDRESS UPDATE Screen
                                    AddressUpScr(
                                      adrNumber: adrNumber,
                                      adrState: adrState,
                                    )));
                      },
                      child: Text(
                        'Edit Address',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),

                    // ! REMOVE ICON listvie builder
                    // ! 2.1.1
                    IconBtn(Icons.delete, submitMethod: () {
                      // // ! CART ITEM DELETE
                      //                       BlocProvider.of<ProdwithcartBloc>(
                      //                           context)
                      //                         ..add(ProdDeleteCartEvent(
                      //                             product_id: state
                      //                                 .productData[0].id
                      //                                 .toString()));
                      //                       // ! END CART ITEM METHOD
                    }),
                  ],
                ),
                title: Text(
                  adrNumber.fullname,
                  // title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                  height: 100,
                  color: Colors.deepOrange,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(adrNumber.phone),
                        Text(adrNumber.house != null
                            ? adrNumber.house
                            : 'house number'),
                        Text(adrNumber.trade != null
                            ? adrNumber.trade
                            : 'Trade'),
                        Text(adrNumber.city != null ? adrNumber.city : 'City'),
                        Text(adrNumber.state != null
                            ? adrNumber.state
                            : 'State'),
                        Text(adrNumber.delTime != null
                            ? adrNumber.delTime
                            : 'DelTime'),
                      ]),
                )),
          ],
        ),
      ),
    );
  }
}
