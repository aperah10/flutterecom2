import 'package:flutter/material.dart';

// ! ORDER PAGE
class OrderAddressPage extends StatelessWidget {
  OrderAddressPage({Key? key}) : super(key: key);

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
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return
              // RadioListTile(
              //   value: index,
              //   groupValue: 'currenty save value in group',
              //   // onChanged: (ind) => setState(() => value = ind),
              //   onChanged: (index) => {},
              //   title: Text("Number title"),
              // );
              Card(
            child: ListTile(
              title: Text("ttttt"),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}

// ! ORDER PRODUCT_TO_JSON

class OrderProductPage extends StatelessWidget {
  dynamic prodNumber;

  OrderProductPage({Key? key, this.prodNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(prodNumber.title),
      subtitle: Column(
        children: [
          Text(prodNumber.discountPrice.toString()),
          Text(prodNumber.description),
          Text(prodNumber.id),
        ],
      ),
      trailing: Icon(Icons.more_vert),
    );
  }
}

// ! ORDER total
class OrderTotalPage extends StatelessWidget {
  const OrderTotalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total Price : -'),
          Row(
            children: [
              Text('Ammount Price  '),
              Text('700  '),
            ],
          ),
          Row(
            children: [
              Text('Shipment Price  '),
              Text('70  '),
            ],
          ),
          Text('Total Price : - 770'),
        ],
      ),
    );
  }
}

// ! Rad Btn
/* -------------------------------------------------------------------------- */
/*                           // ! RADIO LIST BUTTON                           */
/* -------------------------------------------------------------------------- */
class RadBtn extends StatefulWidget {
  RadBtn({
    Key? key,
  }) : super(key: key);

  @override
  _RadBtnState createState() => _RadBtnState();
}

class _RadBtnState extends State<RadBtn> {
  dynamic gValue;

  dynamic isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            RadioListTile(
              activeColor: Colors.orange,
              selected: isSelected != null ? isSelected : false,
              value: 0,
              groupValue: gValue,
              onChanged: (val) {
                setState(() {
                  // isSelected = true;

                  gValue = val;
                });
              },
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ! fullname
                    Text(
                      'Fullname',
                      // title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Phone'),
                    Text('house number'),
                    Text('Trade'),
                  ],
                ),
              ),
            ),
            RadioListTile(
              value: 1,
              groupValue: gValue,
              onChanged: (val) {
                setState(() {
                  gValue = val;
                });
              },
              title: Text('RADIO TITLE'),
            ),
            RadioListTile(
              value: 2,
              groupValue: gValue,
              onChanged: (val) {
                print('this is val ${val}');
                setState(() {
                  gValue = val;
                });
              },
              title: Text('RADIO TITLE'),
            )
          ],
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                // ! steeper                                */
/* -------------------------------------------------------------------------- */

class SteprBtn extends StatefulWidget {
  SteprBtn({Key? key}) : super(key: key);

  @override
  _SteprBtnState createState() => _SteprBtnState();
}

class _SteprBtnState extends State<SteprBtn> {
  int curStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stepper(
        type: StepperType.horizontal,
        physics: ScrollPhysics(),
        currentStep: curStep,
        onStepCancel: () {
          curStep == 0 ? null : setState(() => curStep -= 1);
        },
        onStepContinue: () {
          final isLastStep = curStep == getSteps().length - 1;

          if (isLastStep) {
            print('its complete ');
          } else {
            setState(() => curStep += 1);
          }
        },
        onStepTapped: (step) => setState(() => curStep = step),
        steps: getSteps(),
        controlsBuilder: (BuildContext context,
            {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: onStepContinue,
                child: const Text('NEXT'),
              ),
              TextButton(
                onPressed: onStepCancel,
                child: const Text('CANCEL'),
              ),
            ],
          );
        },
      ),
    ));
  }

  getSteps() => [
        Step(
          state: curStep > 0 ? StepState.complete : StepState.indexed,
          isActive: curStep >= 0,
          title: const Text('Account'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('cpntent for Step 1')),
        ),
        Step(
          state: curStep > 1 ? StepState.complete : StepState.indexed,
          isActive: curStep >= 1,
          title: const Text('Address'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 2')),
        ),
        Step(
          state: curStep > 2 ? StepState.complete : StepState.indexed,
          isActive: curStep >= 2,
          title: const Text('Complete'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 3')),
        ),
      ];
}
