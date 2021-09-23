import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  @override
  _TestState createState() => new _TestState();
}

class _TestState extends State<TestApp> {
  dynamic abc = "bb";

  callback(newAbc) {
    setState(() {
      abc = newAbc;
    });
  }

  @override
  Widget build(BuildContext context) {
    var column = new Column(
      children: <Widget>[
        new Text("This is text parent class $abc"),
        TestApp2(abc: abc, callback: callback)
      ],
    );
    return new MaterialApp(
      home: new Scaffold(
        body: new Padding(padding: EdgeInsets.all(30.0), child: column),
      ),
    );
  }
}

class TestApp2 extends StatefulWidget {
  dynamic abc = 'rahul';
  Function(String)? callback;
  // dynamic callback;

  TestApp2({this.abc, this.callback});

  @override
  _TestState2 createState() => new _TestState2();
}

class _TestState2 extends State<TestApp2> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 150.0,
      height: 30.0,
      margin: EdgeInsets.only(top: 50.0),
      child: new FlatButton(
        onPressed: () {
          widget.callback!("RANDON TEXT mango"); //call to parent
        },
        child: new Text(widget.abc != null ? widget.abc : 'ape '),
        color: Colors.red,
      ),
    );
  }
}
