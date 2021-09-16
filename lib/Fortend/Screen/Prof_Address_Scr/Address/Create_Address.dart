import 'package:flutter/material.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/FormF.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';

class CreateAddressScreen extends StatefulWidget {
  @override
  _CreateAddressScreenState createState() => _CreateAddressScreenState();
}

class _CreateAddressScreenState extends State<CreateAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleName: 'Add Address',
      ),
      body: SafeArea(
        bottom: true,
        top: true,
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ! Name FieldForms
            FieldForms(placeholder: 'Name', inputType: TextInputType.name),
            // ! PHONE field
            FieldForms(placeholder: 'Phone', inputType: TextInputType.phone),

            // ! Address field
            FieldForms(
                placeholder: 'Address', inputType: TextInputType.streetAddress),

            // ! City field
            FieldForms(
                inputType: TextInputType.streetAddress, placeholder: 'City'),

            // ! POSTTAL field
            FieldForms(
                inputType: TextInputType.multiline, placeholder: 'PostalCode'),

            // Login Button
            Center(
                child: SingleBtn(
              btnName: 'Address',
            ))
          ],
        )),
      ),
    );
  }
}
