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
    Item("ID1", "First product", "productid aaaaa", 5),
    Item("ID2", "Second product", "productid bbbbb", 1),
    Item("ID2", "Second product", "productid ccccc", 1),
  ];

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
  Widget singlecartList(int index, cartNum) {
    dynamic productId;
    dynamic quantity;
    if (quantityP == null) {
      quantityP == null ? cartNum.quan : quantity;
    }
    if (productId) {
      productIdP == null ? cartNum.product : productId;
    }
    print('this is qunatityP ${quantityP}');
    print('this is productIdP ${productIdP}');

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.number,
            initialValue: cartNum.quan.toString(),
            onChanged: (text) {
              quantity = text;
              quantityP = quantity;
              print('this is qunatity in Change ${quantity}');
              // takeNumber(text, cartNum.id);
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
                    print('this is qunatityP Btn ${quantityP}');
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
}

class Item {
  final String id;
  final String name;
  final String product;
  final int quan;

  Item(this.id, this.name, this.product, this.quan);
}
