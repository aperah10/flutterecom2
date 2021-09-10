import 'package:flutter/material.dart';

/* -------------------------------------------------------------------------- */
/*                          // ! PRODUCT DETAILS PIC                          */
/* -------------------------------------------------------------------------- */
class SinglePic extends StatelessWidget {
  const SinglePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      elevation: 5.0,
      child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Image(
              image: itemImage(),
              fit: BoxFit.cover,
            ),
          )),
    );
  }

  ImageProvider itemImage() {
    AssetImage image = AssetImage("");
    return image;
  }
}

/* -------------------------------------------------------------------------- */
/*                                // ! CART PIC                               */
/* -------------------------------------------------------------------------- */
class CartPic extends StatelessWidget {
  const CartPic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(''),
        fit: BoxFit.cover,
      )),
    );
  }
}
