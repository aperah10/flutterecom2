import 'package:flutter/material.dart';

class FieldF extends StatefulWidget {
  bool obscureTxt;
  final TextInputType? inputType;
  final String? placeholder;
  String? labelText;
  final TextEditingController? controller;
  String? Function(String?)? formValidator;
  bool brd;
  FieldF(
      {Key? key,
      this.inputType,
      this.placeholder,
      this.controller,
      this.formValidator,
      this.labelText,
      this.brd = true,
      this.obscureTxt = false})
      : super(key: key);

  @override
  _FieldFState createState() => _FieldFState();
}

class _FieldFState extends State<FieldF> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        width: double.infinity,
        margin: EdgeInsets.only(),
        child: TextFormField(
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
