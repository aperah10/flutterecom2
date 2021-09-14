import 'package:flutter/material.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';

class MyOrdersScreen extends StatefulWidget {
  @override
  _MyOrderScreenState createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrdersScreen> {
  @override
  final dl = List.generate(
      15,
      (index) => {
            "id": index,
            "title": "mmm",
            "price": 50,
          }).toList();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleName: 'MyOrderPage',
        // createPage: () => HomeScreen(),
      ),
      body: initScreen(),
    );
  }

  initScreen() {
    return new Container(
        child: Stack(
      children: <Widget>[
        ListView.builder(
            itemCount: dl.length,
            itemBuilder: (context, index) {
              // print(index);
              // return ListdataScreen(
              //     product: CatModel.items[index], iconname: 'refresh');
              return dataOfListView(prod: dl[index]);
            }),
      ],
    ));
  }

  dataOfListView({required dynamic prod}) {
    print(prod);
    return Container(
        child: Card(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      color: Color(0xffEEEEEE),
      child: ListTile(
        // on ListItem clicked
        onTap: () {},

        // Image of ListItem
        leading: Container(
          child: Image.network(''),
        ),

        // Lists of titles
        title: Container(
          margin: EdgeInsets.only(top: 10.0),
          height: 80.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 2.0),
                child: Text(
                  prod.title.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  prod.id.toString(),
                  style: TextStyle(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  prod.price.toString(),
                  style: TextStyle(color: Color(0xff374ABE)),
                ),
              ),
            ],
          ),
        ),

        trailing: Container(
          child: Icon(
            Icons.refresh,
            size: 30,
            color: Color(0xff374ABE),
          ),
        ),
      ),
    ));
  }
}
