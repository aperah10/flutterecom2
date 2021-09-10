import 'package:flutter/material.dart';

import 'Buttons_C.dart';
import 'Text_C.dart';

class DropDownBtn extends StatelessWidget {
  const DropDownBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DropDownOne(dName: 'Select Size'),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
          ),
          DropDownOne(dName: 'Select Color'),
        ],
      ),
    );
  }
}

// ! main drop DropDownBtn AND
class DropDownOne extends StatefulWidget {
  String? dName;
  DropDownOne({Key? key, this.dName}) : super(key: key);

  @override
  _DropDownOneState createState() => _DropDownOneState();
}

class _DropDownOneState extends State<DropDownOne> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['One', 'Two', 'Free', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        hint: SubTxtTitle(titleName: widget.dName),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                            // ! INFORMATION BTN                            */
/* -------------------------------------------------------------------------- */
class InformationBtn extends StatelessWidget {
  const InformationBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 25.0, top: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MultipleBtn(
              btnName: '4.5 star',
            ),
            MultipleBtn(
              btnName: 'Comments',
            ),
            MultipleBtn(
              btnName: '49 Reviews',
            ),
          ],
        ));
  }
}
