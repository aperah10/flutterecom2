import 'package:flutter/material.dart';

class FieldForms extends StatefulWidget {
  bool obscureTxt;
  final TextInputType? inputType;
  final String? placeholder;
  String? labelText;
  bool? status;
  String? pageName;
  dynamic onValue;
  String? inValue;
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
      this.inValue,
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
          // onSaved: (String? newValue) {
          //   // ! DROP DOWN MENU  dropdownValue
          //   setState(() {
          //     widget.onValue = newValue;
          //     print('thiis frm dave value ${widget.onValue}');
          //   });
          // },
          initialValue: widget.inValue,
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

class ProfFieldForms extends StatefulWidget {
  String? placeholder;
  bool status;
  TextInputType? inputType;
  String? labelText;
  String? pageName;
  dynamic onValue;
  dynamic inValue;
  final TextEditingController? controller;
  // var controller = TextEditingController(text: '');
  String? Function(String?)? formValidator;
  bool brd;

  ProfFieldForms({
    Key? key,
    this.placeholder,
    this.status = true,
    this.inputType,
    this.controller,
    this.inValue,
    this.formValidator,
    this.labelText,
    this.pageName,
    this.onValue,
    this.brd = true,
  }) : super(key: key);

  @override
  _ProfFieldFormsState createState() => _ProfFieldFormsState();
}

class _ProfFieldFormsState extends State<ProfFieldForms> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Flexible(
              child: new TextFormField(
                decoration: InputDecoration(hintText: widget.placeholder),
                // ! STATUS MEHTOD
                // enabled: !status,
                controller: widget.controller,
                keyboardType: widget.inputType,
                minLines: 1,
                initialValue: widget.inValue,
                validator: widget.formValidator,
                autofocus: false,
                onSaved: widget.onValue,
                //     (String? newValue) {
                //   // ! DROP DOWN MENU  dropdownValue
                //   setState(() {
                //     widget.onValue = newValue;
                //     print('thiis frm dave value ${widget.onValue}');
                //     // print('thiis frm dave value ${widget.controller}');
                //   });
                // },
              ),
            ),
          ],
        ));
  }
}
