import 'package:flutter/material.dart';

// ! ORDER PRODUCT_TO_JSON

class CurrentOrderPage extends StatelessWidget {
  CurrentOrderPage({Key? key}) : super(key: key);

  @override
  var dl = List.generate(
      15,
      (index) => {
            "id": index,
            "title": "mmm",
            "price": 50,
          });

  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      child: ListView.builder(
        itemCount: dl.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
