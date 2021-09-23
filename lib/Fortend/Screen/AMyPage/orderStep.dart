import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Order/bloc/orderpage_bloc.dart';
import 'package:secd_ecom/Fortend/Screen/Authr_Scr/HomeScr.dart';
import 'package:secd_ecom/Fortend/Screen/Order/MyOrder/orderWidget.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Address/Show_Address.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Address/Show_addone.dart';

class OrderStrp extends StatelessWidget {
  dynamic prodNumber;
  dynamic cartNumber;

  OrderStrp({Key? key, this.cartNumber, this.prodNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderpageBloc, OrderpageState>(listener:
        (context, state) {
      // print('this is Order ${state}');
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
      return Scaffold(
        body: OrderWithStepScr(
            bState: state, cartNumber: cartNumber, prodNumber: prodNumber),
      );
    }));
  }
}

// ! Order

class OrderWithStepScr extends StatefulWidget {
  dynamic bState;
  dynamic cartNumber;
  dynamic prodNumber;
  OrderWithStepScr({Key? key, this.bState, this.prodNumber, this.cartNumber})
      : super(key: key);

  @override
  _OrderWithStepScrState createState() => _OrderWithStepScrState();
}

class _OrderWithStepScrState extends State<OrderWithStepScr> {
  int curStep = 0;
  dynamic adrId;

  //  !   callback method for data
  callback(newAbc) {
    setState(() {
      adrId = newAbc;
      print('this is addressid ${adrId}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.horizontal,
      physics: ScrollPhysics(),
      currentStep: curStep,
      onStepCancel: () {
        curStep == 0 ? null : setState(() => curStep -= 1);
      },
      onStepContinue: () {
        final isLastStep = curStep == 2 - 1;

        if (isLastStep) {
          // BlocProvider.of<OrderpageBloc>(context)
          //   ..add(OrderBtnPressed(
          //       address: adrId, product: widget.prodNumber.id, quantity: 1));
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
                child: const Text('Continue', style: TextStyle(fontSize: 25)),
              ),
              TextButton(
                onPressed: onStepCancel,
                child: const Text('Cancel', style: TextStyle(fontSize: 25)),
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
          // content: Container(child: AddressInOne()
          content: Container(child: Address1()),
        ),
        Step(
          state: curStep > 1 ? StepState.complete : StepState.indexed,
          isActive: curStep >= 1,
          title: const Text('Product'),
          subtitle: const Text('Quantity'),
          content: Container(
            child: Card(
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
        ),
        Step(
          state: curStep > 2 ? StepState.complete : StepState.indexed,
          isActive: curStep >= 2,
          title: const Text('Complete'),
          content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Content for Step 3')),
        ),
      ],
    );
  }
}



// getSteps() => [
//         Step(
//           state: curStep > 0 ? StepState.complete : StepState.indexed,
//           isActive: curStep >= 0,
//           title: const Text('Address'),
//           // content: Container(child: AddressInOne()
//           content: Container(child: Address1()),
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