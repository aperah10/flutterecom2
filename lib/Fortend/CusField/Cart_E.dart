import 'package:flutter/material.dart';
import 'package:secd_ecom/Fortend/CusField/Text_C.dart';

class CartOne extends StatelessWidget {
  const CartOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        TxtTitle(
          "Sub Total: ",
        ),
        SizedBox(
          width: 5,
        ),
        SubTxtTitle(
          '\$700',
        )
        // Text('\$400',
        //     style: TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.w300,
        //       color: Colors.orange,
        //     ))
      ],
    );
  }
}
