import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Order/bloc/orderpage_bloc.dart';
import 'package:secd_ecom/Fortend/Screen/Authr_Scr/HomeScr.dart';
import 'package:secd_ecom/Fortend/Screen/Order/MyOrder/orderWidget.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Address/Show_Address.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Address/Show_addone.dart';

class OrderStrp extends StatefulWidget {
  dynamic prodNumber;
  dynamic cartNumber;
  dynamic adrNumber;

  OrderStrp({Key? key, this.cartNumber, this.prodNumber, this.adrNumber})
      : super(key: key);

  @override
  _OrderStrpState createState() => _OrderStrpState();
}

class _OrderStrpState extends State<OrderStrp> {
  dynamic adrId;
  int curStep = 0;
  dynamic ordQuan = 1;

  //  !   callback method for data
  callback(newAbc) {
    setState(() {
      adrId = newAbc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderpageBloc, OrderpageState>(listener:
        (context, state) {
      if (state is OrderFailure) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text("Order failed."),
            backgroundColor: Colors.red,
          ),
        );
      }
      if (state is OrderSucccess) {
        Navigator.of(context).pushReplacementNamed(HomeScr.routeName);
      }
    }, child:
        BlocBuilder<OrderpageBloc, OrderpageState>(builder: (context, state) {
      if (adrId == null || adrId.isEmpty) {
        adrId = widget.adrNumber[0].id;
      }

      return Scaffold(
        body: Stepper(
            type: StepperType.horizontal,
            physics: ScrollPhysics(),
            currentStep: curStep,
            onStepCancel: () {
              curStep == 0 ? null : setState(() => curStep -= 1);
            },
            onStepContinue: () {
              // print(getSteps().length);
              final isLastStep = curStep == 3 - 1;

              if (isLastStep) {
                print('its Complete');
                BlocProvider.of<OrderpageBloc>(context)
                  ..add(OrderBtnPressed(
                      address: adrId,
                      product: widget.prodNumber.id,
                      quantity: ordQuan));
                print('this is addressid ${adrId}');
              } else {
                setState(() => curStep += 1);
              }
            },
            onStepTapped: (step) => setState(() => curStep = step),
            controlsBuilder: (BuildContext context,
                {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: onStepContinue,
                      child: const Text('Continue',
                          style: TextStyle(fontSize: 25)),
                    ),
                    TextButton(
                      onPressed: onStepCancel,
                      child:
                          const Text('Cancel', style: TextStyle(fontSize: 25)),
                    ),
                  ],
                ),
              );
            },
            steps: [
              Step(
                state: curStep > 0 ? StepState.complete : StepState.indexed,
                isActive: curStep >= 0,
                title: const Text('Address'),
                content: Container(
                  // child: AddressInOne(callback: callback),
                  child: AddressShow(
                      adrState: widget.adrNumber, callback: callback),
                ),
              ),
              Step(
                state: curStep > 1 ? StepState.complete : StepState.indexed,
                isActive: curStep >= 1,
                title: const Text('Order'),
                subtitle: const Text('Delivery'),
                content: Container(
                  child: Column(
                    children: [
                      Text('Quantity'),
                      OrderProductPage(
                        prodNumber: widget.prodNumber,
                      ),
                    ],
                  ),
                ),
              ),
              Step(
                state: curStep > 2 ? StepState.complete : StepState.indexed,
                isActive: curStep >= 2,
                title: const Text('Payment'),
                content: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text('Content for Step 3')),
              ),
            ]),
      );
    }));
  }

  // getSteps() => [
  //       Step(
  //         state: curStep > 0 ? StepState.complete : StepState.indexed,
  //         isActive: curStep >= 0,
  //         title: const Text('Address'),
  //         content: Container(
  //           child: AddressInOne(callback: callback),
  //         ),
  //       ),
  //       Step(
  //         state: curStep > 1 ? StepState.complete : StepState.indexed,
  //         isActive: curStep >= 1,
  //         title: const Text('Product'),
  //         subtitle: const Text('Quantity'),
  //         content: Container(
  //           child: Card(
  //             child: Column(
  //               children: [
  //                 Text('Quantity'),
  //                 OrderProductPage(
  //                   prodNumber: widget.prodNumber,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //       Step(
  //         state: curStep > 2 ? StepState.complete : StepState.indexed,
  //         isActive: curStep >= 2,
  //         title: const Text('Complete'),
  //         content: Container(
  //             alignment: Alignment.centerLeft,
  //             child: const Text('Content for Step 3')),
  //       ),
  //     ];
}








// class OrderStrp extends StatefulWidget {
//   dynamic prodNumber;
//   dynamic cartNumber;

//   OrderStrp({Key? key, this.cartNumber, this.prodNumber}) : super(key: key);

//   @override
//   _OrderStrpState createState() => _OrderStrpState();
// }

// class _OrderStrpState extends State<OrderStrp> {
//   dynamic adrId;

//   //  !   callback method for data
//   callback(newAbc) {
//     setState(() {
//       adrId = newAbc;
//       print('this is addressid ${adrId}');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<OrderpageBloc, OrderpageState>(listener:
//         (context, state) {
//       // print('this is Order ${state}');
//       if (state is OrderFailure) {
//         Scaffold.of(context).showSnackBar(
//           SnackBar(
//             content: Text("Order failed."),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//       if (state is OrderSucccess) {
//         Navigator.of(context).pushReplacementNamed(HomeScr.routeName);
//       }
//     }, child:
//         BlocBuilder<OrderpageBloc, OrderpageState>(builder: (context, state) {
//       return Scaffold(
//         body: OrderWithStepScr(
//             bState: state,
//             cartNumber: widget.cartNumber,
//             prodNumber: widget.prodNumber,
//             callback: callback),
//       );
//     }));
//   }
// }


// ! Order

// class OrderWithStepScr extends StatefulWidget {
//   dynamic callback;
//   dynamic bState;
//   dynamic cartNumber;
//   dynamic prodNumber;
//   OrderWithStepScr(
//       {Key? key, this.bState, this.prodNumber, this.cartNumber, this.callback})
//       : super(key: key);

//   @override
//   _OrderWithStepScrState createState() => _OrderWithStepScrState();
// }

// class _OrderWithStepScrState extends State<OrderWithStepScr> {
//   int curStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     // print(' this is adr id data in order step pgae ${adrId}');

//     return Stepper(
//         type: StepperType.horizontal,
//         physics: ScrollPhysics(),
//         currentStep: curStep,
//         onStepCancel: () {
//           curStep == 0 ? null : setState(() => curStep -= 1);
//         },
//         onStepContinue: () {
//           print(getSteps().length);
//           final isLastStep = curStep == 2 - 1;

//           if (isLastStep) {
//             // BlocProvider.of<OrderpageBloc>(context)
//             //   ..add(OrderBtnPressed(
//             //       address: adrId, product: widget.prodNumber.id, quantity: 1));
//           } else {
//             setState(() => curStep += 1);
//           }
//         },
//         onStepTapped: (step) => setState(() => curStep = step),
//         controlsBuilder: (BuildContext context,
//             {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: <Widget>[
//                 TextButton(
//                   onPressed: onStepContinue,
//                   child: const Text('Continue', style: TextStyle(fontSize: 25)),
//                 ),
//                 TextButton(
//                   onPressed: onStepCancel,
//                   child: const Text('Cancel', style: TextStyle(fontSize: 25)),
//                 ),
//               ],
//             ),
//           );
//         },
//         steps: getSteps());
//   }

//   getSteps() => [
//         Step(
//           state: curStep > 0 ? StepState.complete : StepState.indexed,
//           isActive: curStep >= 0,
//           title: const Text('Address'),
//           // content: Container(child: AddressInOne()
//           content: Container(child: AddressInOne(callback: widget.callback)),
//         ),
//         Step(
//           state: curStep > 1 ? StepState.complete : StepState.indexed,
//           isActive: curStep >= 1,
//           title: const Text('Product'),
//           subtitle: const Text('Quantity'),
//           content: Container(
//             child: Card(
//               child: Column(
//                 children: [
//                   Text('Quantity'),
//                   OrderProductPage(
//                     prodNumber: widget.prodNumber,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Step(
//           state: curStep > 2 ? StepState.complete : StepState.indexed,
//           isActive: curStep >= 2,
//           title: const Text('Complete'),
//           content: Container(
//               alignment: Alignment.centerLeft,
//               child: const Text('Content for Step 3')),
//         ),
//       ];
// }
