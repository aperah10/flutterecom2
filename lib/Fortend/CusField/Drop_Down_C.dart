import 'package:flutter/material.dart';
import 'package:secd_ecom/Afile/ListFile/StateList.dart';

import 'Buttons_C.dart';
import 'Text_C.dart';

class DropDownBtnF extends StatelessWidget {
  dynamic listData;
  DropDownBtnF({Key? key, this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          // DropDownOne(dName: 'Select Size'),
          Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
          ),
          DropDownBtn(
            dName: 'Select Color',
            listData: listData,
          ),
        ],
      ),
    );
  }
}

// ! main drop DropDownBtn AND
class DropDownBtn extends StatefulWidget {
  String? dName;
  dynamic listData;
  String pageName;
  String? currentItem;
  // final ValueChanged<String>? itemCallBack;

  TextEditingController? listController = new TextEditingController();
  String? Function(String?)? formValidator;
  DropDownBtn(
      {Key? key,
      this.dName,
      this.listData,
      this.listController,
      this.pageName = 'Item',
      this.formValidator,
      // this.onValue,
      // this.itemCallBack,
      this.currentItem})
      : super(key: key);

  @override
  _DropDownBtnState createState() => _DropDownBtnState();
}

class _DropDownBtnState extends State<DropDownBtn> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField<String>(
        // ! DROP DOWN MENU dropdownValue
        // value: dropdownValue,
        value: widget.currentItem,
        validator: widget.formValidator,
        isExpanded: true,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),

        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue;
            widget.currentItem = newValue;
            widget.listController!.text = newValue!;
          });
        },

        items:
            // AllListData.GenderData
            // <String>['Male', 'Female', 'Other']
            widget.listData.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),

        // ! DROP DOWN MENU Dname
        hint: SubTxtTitle(
            widget.currentItem == null ? widget.pageName : widget.dName),
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
