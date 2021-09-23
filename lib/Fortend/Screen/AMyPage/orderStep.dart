import 'package:flutter/material.dart';

class OrderWithStepScr extends StatelessWidget {
  const OrderWithStepScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ! ORDER AADREES PAGE
                // OrderAddressPage(),
                // // ! ORDER AADREES product
                // OrderProductPage(),
                // // ! ORDER AADREES total
                // OrderTotalPage(),
              ],
            ),
          )),
    );
  }
}
