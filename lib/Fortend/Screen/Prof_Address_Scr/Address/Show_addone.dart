import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Address/address_bloc.dart';

import 'Create_Address.dart';
import 'Show_Address.dart';

/* -------------------------------------------------------------------------- */
/*                       // ! Child Class for order page                      */
/* -------------------------------------------------------------------------- */
class AddressInOne extends StatefulWidget {
  // dynamic callback;
  Function(String)? callback;
  AddressInOne({Key? key, this.callback}) : super(key: key);

  @override
  _AddressInOneState createState() => _AddressInOneState();
}

class _AddressInOneState extends State<AddressInOne> {
  // ! Address instance
  //  ProductshowBloc prodBloc = ProductshowBloc(prodRespo: ProductDataRespo());
  AddressBloc prodBloc = AddressBloc();
  dynamic gValue = 0;
  dynamic idt;

  @override
  void initState() {
    prodBloc = BlocProvider.of<AddressBloc>(context);
    prodBloc.add(FetchAddressEvent());
    super.initState();
  }

  // //  !   callback method for data

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
      },
      child: BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
        if (state is AddressLoadedState) {
          if (idt == null || idt.toString().isEmpty) {
            idt = state.addressData[0].id;
          }
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
              state.addressData.isNotEmpty
                  ? Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return RadioListTile(
                              value: index,
                              groupValue: gValue,
                              onChanged: (ind) {
                                setState(() {
                                  gValue = ind;
                                  idt = state.addressData[index].id;
                                  // print('idt :- ${idt}');
                                  widget.callback!(idt);
                                });
                              },
                              title: AddressDataM(
                                  adrNumber: state.addressData[index]),
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

        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}
