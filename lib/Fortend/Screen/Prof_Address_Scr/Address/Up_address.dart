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
  static const routeName = '/edit-address-post';
  AddressUpScr({Key? key}) : super(key: key);

  //   // ! Address instance
  // //  ProductshowBloc prodBloc = ProductshowBloc(prodRespo: ProductDataRespo());
  // AddressBloc prodBloc = AddressBloc();

  // @override
  // void initState() {
  //   prodBloc = BlocProvider.of<AddressBloc>(context);
  //   prodBloc.add(FetchAddressEvent());
  //   super.initState();
  // }

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
          if (state is AddressLoadedState) {
            print(state.addressData);
            return UpAddress2(adrState: state.addressData);
          }

          return Center(child: CircularProgressIndicator());
        }),
      ),
    ));
  }
}

/* -------------------------------------------------------------------------- */
/*                                 // !  LOGIC                                */
/* -------------------------------------------------------------------------- */

/* -------------------------------------------------------------------------- */
/*                              // ! ADDRESS SHOW                             */
/* -------------------------------------------------------------------------- */
class UpAddress2 extends StatelessWidget {
  dynamic adrState;
  UpAddress2({Key? key, this.adrState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // padding:
        //     EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! Conatiner for listview builder
        Container(
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: adrState.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                // childAspectRatio: 0.60,
                // crossAxisSpacing: 20,
                //   mainAxisSpacing: 20
              ),
              // padding: EdgeInsets.symmetric(horizontal: 20.0),
              itemBuilder: (context, index) {
                // print(cartState.length);

                return AddressGridListShow(
                  adrNumber: adrState[index],
                );
              }),
        )

        // // ! Address field DATA
      ],
    ));
  }
}

class UpAddressScreen extends StatefulWidget {
  dynamic adrState;
  UpAddressScreen({Key? key, this.adrState}) : super(key: key);
  @override
  _UpAddressScreenState createState() => _UpAddressScreenState();
}

class _UpAddressScreenState extends State<UpAddressScreen> {
  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailsController = TextEditingController();
  final phoneController = TextEditingController();
  final houseController = TextEditingController();
  final tradeController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final pinCodeController = TextEditingController();
  final stateController = TextEditingController();
  final delTimeController = TextEditingController();
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
      AddressSaveButtonEvent(
        fullname: nameController.text,
        email: emailsController.text,
        phone: phoneController.text,
        house: houseController.text,
        trade: tradeController.text,
        city: cityController.text,
        area: areaController.text,
        state: stateController.text,
        pinCode: pinCodeController.text,
        delTime: delTimeController.text,
      ),
    );
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
              // ! Name FieldForms
              FieldForms(
                placeholder: 'Name',
                inputType: TextInputType.name,
                controller: nameController,
              ),
              // ! PHONE field
              FieldForms(
                placeholder: 'Phone',
                inputType: TextInputType.phone,
                controller: phoneController,
              ),

              // ! Email field
              FieldForms(
                placeholder: 'Email',
                inputType: TextInputType.emailAddress,
                controller: emailsController,
              ),

              // ! House field
              FieldForms(
                  placeholder: 'house',
                  inputType: TextInputType.name,
                  controller: houseController),
              // ! Address field
              FieldForms(
                  placeholder: 'Trade',
                  inputType: TextInputType.name,
                  controller: tradeController),

              // ! City field
              FieldForms(
                  inputType: TextInputType.name,
                  placeholder: 'City',
                  controller: cityController),

              // ! City field
              FieldForms(
                inputType: TextInputType.name,
                placeholder: 'Area',
                controller: areaController,
              ),

              // ! POSTTAL field
              FieldForms(
                inputType: TextInputType.number,
                placeholder: 'PostalCode',
                controller: pinCodeController,
              ),

              // ! DROP DOWN FOR STATE_LIST
              DropDownBtn(
                dName: 'State',
                listData: AllListData.stateData,
                listController: stateController,
              ),

              // ! DELIVEY TIME
              DropDownBtn(
                dName: 'Delivery Time',
                listData: AllListData.deliveryData,
                listController: delTimeController,
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
    ));
  }
}
