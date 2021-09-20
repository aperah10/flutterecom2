import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Afile/ListFile/StateList.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Address/address_bloc.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/Drop_Down_C.dart';
import 'package:secd_ecom/Fortend/CusField/FormF.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';

import 'Show_Address.dart';

class AddressUpScr extends StatelessWidget {
  static const routeName = '/up-address121-post';
  dynamic adrState;
  dynamic adrNumber;
  AddressUpScr({Key? key, this.adrNumber, this.adrState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocListener<AddressBloc, AddressState>(
        listener: (context, state) {
          // print('this is listner ${state}');

          if (state is AddressLoadingState) {
            Center(child: CircularProgressIndicator());
          }
          if (state is AddressErrorState) {
            Center(child: Text(state.error.toString()));
          }
          if (state is AddressSuccessState) {
            Navigator.of(context)
                .pushReplacementNamed(AddressShowScr.routeName);
          }
        },
        child:
            BlocBuilder<AddressBloc, AddressState>(builder: (context, state) {
          // print('this is builder ${state}');
          // if (state is AddressLoadedState) {
          //   print(state.addressData);
          //   return UpAddressScreen(adrState: state.addressData);
          // }

          return UpAddressScreen(adrState: adrState, adrNumber: adrNumber);
        }),
      ),
    ));
  }
}

// /* -------------------------------------------------------------------------- */
// /*                                 // !  LOGIC                                */
// /* -------------------------------------------------------------------------- */

// /* -------------------------------------------------------------------------- */
// /*                              // ! ADDRESS SHOW                             */
// /* -------------------------------------------------------------------------- */
// class UpAddress2 extends StatelessWidget {
//   dynamic adrState;
//   UpAddress2({Key? key, this.adrState}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         // padding:
//         //     EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ! Conatiner for listview builder
//         Container(
//           child: ListView.builder(
//               shrinkWrap: true,
//               itemCount: adrState.length,
//               // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               //   crossAxisCount: 1,
//               //   // childAspectRatio: 0.60,
//               //   // crossAxisSpacing: 20,
//               //   //   mainAxisSpacing: 20
//               // ),
//               // padding: EdgeInsets.symmetric(horizontal: 20.0),
//               itemBuilder: (context, index) {
//                 // print(cartState.length);

//                 return UpAddressScreen(
//                     adrNumber: adrState[index], adrState: adrState);
//               }),
//         )

//         // // ! Address field DATA
//       ],
//     ));
//   }
// }

class UpAddressScreen extends StatefulWidget {
  dynamic adrNumber;
  dynamic adrState;
  UpAddressScreen({Key? key, this.adrNumber, this.adrState}) : super(key: key);
  @override
  _UpAddressScreenState createState() => _UpAddressScreenState();
}

class _UpAddressScreenState extends State<UpAddressScreen> {
  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final houseController = TextEditingController();
  final tradeController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final pinCodeController = TextEditingController();
  final stateController = TextEditingController();
  final delTimeController = TextEditingController();

  dynamic nameSaved;
  dynamic emailSaved;
  dynamic phoneSaved;
  dynamic houseSaved;
  dynamic tradeSaved;
  dynamic areaSaved;
  dynamic citySaved;
  dynamic stateSaved;
  dynamic pinCodeSaved;
  dynamic delTimeSaved;
  /* -------------------------------------------------------------------------- */
  /*                              // ! Address BUTTON                             */
  /* -------------------------------------------------------------------------- */
  _addressBtn() async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return "Enter the Correct Value";
    }
    _form.currentState!.save();

    var isToken = BlocProvider.of<AddressBloc>(context).add(
      AddressUpBtnEvent(
        id: widget.adrNumber.id,
        fullname: nameController.text.isNotEmpty || nameController.text != null
            ? nameController.text
            : widget.adrNumber.fullname,
        email: emailController.text.isNotEmpty || emailController.text != null
            ? emailController.text
            : widget.adrNumber.email,
        phone: phoneController.text.isNotEmpty || phoneController.text != null
            ? phoneController.text
            : widget.adrNumber.phone,
        house: houseController.text.isNotEmpty || houseController.text != null
            ? houseController.text
            : widget.adrNumber.house,
        trade: tradeController.text.isNotEmpty || tradeController.text != null
            ? tradeController.text
            : widget.adrNumber.trade,
        city: cityController.text.isNotEmpty || cityController.text != null
            ? cityController.text
            : widget.adrNumber.city,
        area: areaController.text.isNotEmpty || areaController.text != null
            ? areaController.text
            : widget.adrNumber.area,
        pinCode:
            pinCodeController.text.isNotEmpty || pinCodeController.text != null
                ? pinCodeController.text
                : widget.adrNumber.pinCode,
        state: stateController.text.isNotEmpty
            ? stateController.text
            : widget.adrNumber.state,
        delTime: delTimeController.text.isNotEmpty
            ? delTimeController.text
            : widget.adrNumber.delTime,
      ),
    );

    print('------------------------------------------------------');
    // print('updte address data $nameController ');
    // print('updte address data $emailController ');
    // print('updte address data $phoneController ');
    // print('updte address data $houseController ');
    // print('updte address data $tradeController ');
    // print('updte address data $areaController ');
    // print('updte address data $cityController ');
    // print('updte address data $pinCodeController ');
    print(stateController.text.isEmpty ? " yes empty" : 'no empty ');
    print(delTimeController.text.isNotEmpty ? " not empty" : 'yes empty ');
    print('updte Vlaue ${stateController.value}');
    print('updte Vlaue ${delTimeController.value} ');

    print('------------------------------------------------------');
    print('already data  ${widget.adrNumber.id} ');
    print('already data ${widget.adrNumber.fullname} ');
    print(' phone ${widget.adrNumber.phone} ');
    print('house ${widget.adrNumber.house} ');
    print('trade ${widget.adrNumber.trade} ');
    print('area ${widget.adrNumber.area} ');
    print('city ${widget.adrNumber.city} ');
    print('pinCode ${widget.adrNumber.pinCode} ');
    print('state ${widget.adrNumber.state} ');
    print('delTime ${widget.adrNumber.delTime} ');
  }

  /* -------------------------------------------------------------------------- */
  /*                             // ! END Address BUTTON FORM                            */
  /* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ! Name ProfFieldForms
                ProfFieldForms(
                  inValue: widget.adrNumber.fullname.toString().isNotEmpty
                      ? widget.adrNumber.fullname
                      : '',
                  placeholder: 'Name',
                  inputType: TextInputType.name,
                  // controller: nameController,
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      // nameSaved = newValue;
                      // nameController.text = nameSaved;
                      nameController.text = newValue!;
                    });
                  },
                ),
                // ! PHONE field
                ProfFieldForms(
                  inValue: widget.adrNumber.phone.toString().isNotEmpty
                      ? widget.adrNumber.phone
                      : '',
                  placeholder: 'Phone',
                  inputType: TextInputType.phone,
                  // controller: phoneController,
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      // phoneSaved = newValue;
                      // phoneController.text = phoneSaved;
                      phoneController.text = newValue!;
                    });
                  },
                ),

                // ! Email field
                ProfFieldForms(
                  placeholder: 'Email',
                  inputType: TextInputType.emailAddress,
                  // controller: emailController,
                  inValue: widget.adrNumber.email.toString().isNotEmpty
                      ? widget.adrNumber.email
                      : '',
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      // emailSaved = newValue;
                      // emailController.text = emailSaved;
                      emailController.text = newValue!;
                    });
                  },
                ),

                // ! House field
                ProfFieldForms(
                  placeholder: 'house',
                  inputType: TextInputType.name,
                  // controller: houseController,
                  inValue: widget.adrNumber.house.toString().isNotEmpty
                      ? widget.adrNumber.house
                      : '',
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      // houseSaved = newValue;
                      // houseController.text = houseSaved;
                      houseController.text = newValue!;
                    });
                  },
                ),
                // ! Address field
                ProfFieldForms(
                  placeholder: 'Trade',
                  inputType: TextInputType.name,
                  // controller: tradeController,
                  inValue: widget.adrNumber.trade.toString().isNotEmpty
                      ? widget.adrNumber.trade
                      : '',
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      // tradeSaved = newValue;
                      // tradeController.text = tradeSaved;
                      tradeController.text = newValue!;
                    });
                  },
                ),

                // ! City field
                ProfFieldForms(
                  inputType: TextInputType.name,
                  placeholder: 'City',
                  // controller: cityController,
                  inValue: widget.adrNumber.city.toString().isNotEmpty
                      ? widget.adrNumber.city
                      : '',
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      // citySaved = newValue;
                      // cityController.text = citySaved;
                      cityController.text = newValue!;
                    });
                  },
                ),

                // ! City field
                ProfFieldForms(
                  inputType: TextInputType.name,
                  placeholder: 'Area',
                  // controller: areaController,
                  inValue: widget.adrNumber.area.toString().isNotEmpty
                      ? widget.adrNumber.area
                      : '',
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      // areaSaved = newValue;
                      // areaController.text = areaSaved;
                      areaController.text = newValue!;
                    });
                  },
                ),

                // ! POSTTAL field
                ProfFieldForms(
                  inputType: TextInputType.number,
                  placeholder: 'PostalCode',
                  // controller: pinCodeController,
                  inValue: widget.adrNumber.pinCode.toString().isNotEmpty
                      ? widget.adrNumber.pinCode
                      : '',
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      // pinCodeSaved = newValue;
                      // pinCodeController.text = pinCodeSaved;
                      pinCodeController.text = newValue!;
                    });
                  },
                ),

                // ! DROP DOWN FOR STATE_LIST
                DropDownBtn(
                  pageName: 'State',
                  dName: widget.adrNumber.state.toString().isNotEmpty
                      ? widget.adrNumber.state
                      : 'State',
                  listData: AllListData.stateData,
                  listController: stateController,
                  currentItem: widget.adrNumber.state.toString().isNotEmpty
                      ? widget.adrNumber.state
                      : null,
                ),

                // ! DELIVEY TIME
                DropDownBtn(
                  dName: widget.adrNumber.delTime.toString().isNotEmpty
                      ? widget.adrNumber.delTime
                      : 'Delivery Time',
                  pageName: 'Delivery Time',
                  listData: AllListData.deliveryData,
                  listController: delTimeController,
                  currentItem: widget.adrNumber.delTime.toString().isNotEmpty
                      ? widget.adrNumber.delTime
                      : null,
                ),

                // Login Button
                Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
                  child: widget.adrState is AddressLoadingState
                      ? CupertinoActivityIndicator()
                      : SingleBtn(
                          btnName: 'Save',
                          submitMethod: _addressBtn,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
