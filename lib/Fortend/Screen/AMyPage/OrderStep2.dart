import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Order/bloc/orderpage_bloc.dart';
import 'package:secd_ecom/Fortend/Screen/Authr_Scr/HomeScr.dart';
import 'package:secd_ecom/Fortend/Screen/Prof_Address_Scr/Address/Show_Address.dart';

class OrderStrp2 extends StatefulWidget {
  OrderStrp2({Key? key}) : super(key: key);

  @override
  _OrderStrp2State createState() => _OrderStrp2State();
}

class _OrderStrp2State extends State<OrderStrp2> {
  dynamic adrId;
  int curStep = 0;
  dynamic ordQuan = 1;

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
        // adrId = widget.adrNumber[0].id;
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
                // BlocProvider.of<OrderpageBloc>(context)
                //   ..add(OrderBtnPressed(
                //       address: adrId,
                //       product: widget.prodNumber.id,
                //       quantity: ordQuan));
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
                  child: AddressShowScr(),
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
                      // OrderProductPage(
                      //   prodNumber: widget.prodNumber,
                      // ),
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
}
