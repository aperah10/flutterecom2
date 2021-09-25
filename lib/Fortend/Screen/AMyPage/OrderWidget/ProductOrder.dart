import 'package:flutter/material.dart';

// ! ORDER PRODUCT_TO_JSON

class OrderwithCP extends StatefulWidget {
  // dynamic cartList;

  OrderwithCP({
    Key? key,
  }) : super(key: key);

  @override
  _OrderwithCPState createState() => _OrderwithCPState();
}

class _OrderwithCPState extends State<OrderwithCP> {
  // List<TextEditingController>? _controllers = [];
  List<Item> cartList = [
    Item(id: "ID1", name: "First product", product: "productid aaaaa", quan: 5),
    Item(
        id: "ID2", name: "Second product", product: "productid bbbbb", quan: 1),
    Item(
        id: "ID3", name: "Second product", product: "productid ccccc", quan: 1),
  ];
  List<Item> cartSaved = [];
  dynamic productIdP;
  dynamic quantityP;

  // takeNumber(String text, String itemId) {
  //   try {
  //     int number = int.parse(text);
  //     quantityP = number;
  //     productIdP = itemId;
  //   } on FormatException {}
  // }

  // Widget singlecartList(
  // int index, cartNum, TextEditingController controllertxt) {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo")),
      body: Container(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  // _controllers!.add(new TextEditingController());
                  print(' cardSaved list in ListView Builder ');
                  print(cartSaved);
                  if (cartList.isEmpty) {
                    return CircularProgressIndicator();
                  } else {
                    return ListTile(
                      title: Text('product id  ${cartList[index].product}'),
                      // subtitle: singlecartList(
                      // index, cartList[index], _controllers![index]),

                      subtitle: singlecartList(index, cartList[index]),
                    );
                  }
                }),

            // ! btn for save data logic
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                  onTap: () {
                    print('btn calikc');
                    // print(cartSaved);
                    for (var v in cartSaved) {
                      print(v.id);
                      print(v.name);
                    }
                  },
                  child: Text(
                    'Order',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget singlecartList(int index, cartNum) {
    dynamic productId;
    dynamic quantity;
    if (quantity == null || quantity.isEmpty) {
      Item cartI = Item(
          name: cartNum.name, product: cartNum.product, quan: cartNum.quan);
      cartSaved.add(cartI);
      // print(cartSaved);
      // for (var v in cartSaved) {
      //   print(v.id);
      // }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: cartNum.quan.toString(),
            // controller: TextEditingController(text: cartNum.quan.toString()),
            onChanged: (text) {
              quantity = text;
              // quantityP = quantity;

              Item cartI = Item(
                  name: cartNum.name,
                  product: cartNum.product,
                  quan: int.parse(quantity));
              cartSaved.add(cartI);
              // print(' cardSaved list in Changed ');
              // print(cartSaved);
              // for (var v in cartSaved) {
              //   print(v.id);
              // }
            },
            // controller: controllertxt,
            decoration: InputDecoration(
              labelText: "Qty",
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  final String? id;
  final String? name;
  final String product;
  final int quan;

  Item({this.id, this.name, required this.product, required this.quan});
}
