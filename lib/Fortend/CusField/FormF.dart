import 'package:flutter/material.dart';

class FieldForms extends StatefulWidget {
  bool obscureTxt;
  final TextInputType? inputType;
  final String? placeholder;
  String? labelText;
  bool? status;
  String? pageName;
  dynamic onValue;
  final TextEditingController? controller;
  String? Function(String?)? formValidator;
  bool brd;
  FieldForms(
      {Key? key,
      this.inputType,
      this.placeholder,
      this.controller,
      this.formValidator,
      this.labelText,
      this.status,
      this.pageName,
      this.brd = true,
      this.onValue,
      this.obscureTxt = false})
      : super(key: key);

  @override
  _FieldFState createState() => _FieldFState();
}

class _FieldFState extends State<FieldForms> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: double.infinity,
        margin: EdgeInsets.only(),
        child: TextFormField(
          // onChanged: (String? newValue) {
          //   // ! DROP DOWN MENU  dropdownValue
          //   setState(() {
          //     widget.onValue = newValue;
          //   });
          // },
          initialValue: widget.onValue,
          obscureText: widget.obscureTxt,
          controller: widget.controller,
          keyboardType: widget.inputType,
          minLines: 1,
          validator: widget.formValidator,
          autofocus: false,
          decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.placeholder,
              // labelText: "Name",     // Set text upper animation
              border: widget.brd ? OutlineInputBorder() : null,
              suffixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: widget.placeholder == 'Password' &&
                        widget.inputType == TextInputType.visiblePassword
                    ? IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            widget.obscureTxt = !widget.obscureTxt;
                          });
                        },
                        icon: Icon(
                          widget.obscureTxt
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                      )
                    : null,
              )),
        ),
      ),
    );
  }
}

// ! PROFILE FORM FILEDS

class ProfFieldForms extends StatelessWidget {
  String placeholder;
  bool status;
  TextInputType? inputType;
  final TextEditingController? controller;
  ProfFieldForms(
      {Key? key,
      required this.placeholder,
      this.status = true,
      this.inputType,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Flexible(
              child: new TextFormField(
                decoration: InputDecoration(hintText: placeholder),
                // ! STATUS MEHTOD
                enabled: !status,
                controller: controller,
                keyboardType: inputType,
                minLines: 1,

                autofocus: false,
              ),
            ),
          ],
        ));
  }
}
