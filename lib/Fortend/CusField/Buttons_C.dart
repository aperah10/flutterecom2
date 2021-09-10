import 'package:flutter/material.dart';

/* -------------------------------------------------------------------------- */
/*                   // ! SINGLE BUTTON :- 1 BUTTON IN PAGE                   */
/* -------------------------------------------------------------------------- */
class SingleBtn extends StatelessWidget {
  final String btnName;
  // final Widget Function() createPage;
  dynamic submitMethod;
  SingleBtn({Key? key, required this.btnName, this.submitMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: double.infinity,
        padding: EdgeInsets.only(top: 3, left: 3),
        // decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(5),
        //     border: Border(
        //       bottom: BorderSide(color: Colors.black),
        //       top: BorderSide(color: Colors.black),
        //       left: BorderSide(color: Colors.black),
        //       right: BorderSide(color: Colors.black),
        //     )),
        child: MaterialButton(
          // minWidth: double.infinity,
          height: 40,
          onPressed: submitMethod,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [new Color(0xff374ABE), new Color(0xff64B6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 300.0,
                  minHeight: 40.0,
                  maxHeight: 55.0), // min sizes for Material buttons
              alignment: Alignment.center,
              child: Text(
                btnName,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
  }
}

/* -------------------------------------------------------------------------- */
/*                    // ! MULTIPLE BUTTON 2 BUTTON IN PAGE                   */
/* -------------------------------------------------------------------------- */
class MultipleBtn extends StatelessWidget {
  String btnName;
  dynamic submitMethod;

  MultipleBtn({
    Key? key,
    required this.btnName,
    this.submitMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: MaterialButton(
          color: btnName == 'Buy' ? Colors.deepOrange : Colors.black54,
          elevation: 0,
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              btnName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                   // ! FOURTH BTN :-  4 BUTTON IN ON PAGE                  */
/* -------------------------------------------------------------------------- */
class ForthBtn extends StatelessWidget {
  String btnName;
  dynamic submitMethod;
  ForthBtn({Key? key, required this.btnName, this.submitMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: () {},
            // sendPage
            //     () {
            //   Navigator.of(context).pushReplacementNamed(submitMethod);
            // },
            child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.redAccent, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Center(
                    child: Text(btnName,
                        style: TextStyle(color: Colors.white))))));
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! EXTRA BUTTON                             */
/* -------------------------------------------------------------------------- */
class ExtraBtn extends StatelessWidget {
  String btnName;
  dynamic submitMethod;
  ExtraBtn({Key? key, required this.btnName, this.submitMethod})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: EdgeInsets.only(top: 20.0),
            padding: EdgeInsets.only(bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Already have an account? "),
                GestureDetector(
                  child: Text(
                    btnName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => createPage()));
                    Navigator.of(context).pushReplacementNamed(submitMethod);
                  },
                )
              ],
            )));
  }
}
