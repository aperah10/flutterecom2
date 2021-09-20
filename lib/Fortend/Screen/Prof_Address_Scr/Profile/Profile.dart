// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Profile/profile_bloc.dart';
// import 'package:secd_ecom/Fortend/CusField/Aviatar_Pic.dart';
// import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
// import 'package:secd_ecom/Fortend/CusField/FormF.dart';

// import 'Edit_P.dart';

// class ProfileScr1 extends StatefulWidget {
//   dynamic profState;
//   ProfileScr1({Key? key, this.profState}) : super(key: key);

//   @override
//   _ProfileScr1State createState() => _ProfileScr1State();
// }

// class _ProfileScr1State extends State<ProfileScr1>
//     with SingleTickerProviderStateMixin {
// // ! mehtod
//   bool _status = true;
//   final FocusNode myFocusNode = FocusNode();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

// // ! end mehtod

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: CustomAppBar(titlename: 'ProfilePage', createPage: ()=>HomeScreen()),
//         body: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 child: _status ? Text('Personal Information') : new Container(),
//               ),
//               Container(
//                 child: // ! staus for Editing
//                     _status ? _getEditIcon() : new Container(),
//               ),
//             ],
//           ),
//           //  ! PROFILE FORM EDITI
//           ProfileFormOne(
//             _status,
//             profState: widget.profState,
//           )
//         ],
//       ),
//     ));
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is disposed
//     myFocusNode.dispose();
//     super.dispose();
//   }

//   Widget _getEditIcon() {
//     return new GestureDetector(
//       child: new CircleAvatar(
//         backgroundColor: Colors.red,
//         radius: 14.0,
//         child: new Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 16.0,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _status = false;
//         });
//       },
//     );
//   }
// }

// // ! PROFILE ONE EDITITN PAGE
// class ProfileFormOne extends StatefulWidget {
//   bool _status;
//   dynamic profState;
//   ProfileFormOne(this._status, {Key? key, this.profState}) : super(key: key);

//   @override
//   _ProfileFormOneState createState() => _ProfileFormOneState();
// }

// class _ProfileFormOneState extends State<ProfileFormOne> {
//   final _form = GlobalKey<FormState>();
//   final nameController = TextEditingController();
//   final emailsController = TextEditingController();
//   final genderController = TextEditingController();
//   /* -------------------------------------------------------------------------- */
//   /*                              // ! Profile BUTTON                             */
//   /* -------------------------------------------------------------------------- */
//   _profileBtn() async {
//     var isvalid = _form.currentState!.validate();
//     if (!isvalid) {
//       return "Enter the Correct Value";
//     }
//     _form.currentState!.save();

//     var isToken = BlocProvider.of<ProfileBloc>(context).add(
//       ProfileSaveButtonEvent(
//           fullname: nameController.text,
//           email: emailsController.text,
//           gender: genderController.text),
//     );
//   }

//   /* -------------------------------------------------------------------------- */
//   /*                             // ! END PROFILE BUTTON FORM                            */
//   /* -------------------------------------------------------------------------- */

//   @override
//   Widget build(BuildContext context) {
//     // print('this profState ${widget.profState[0].fullname}');
//     return Container(
//       child: Padding(
//         padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
//         child: Form(
//             key: _form,
//             child: Column(children: <Widget>[
//               // NameEdit text
//               ProfFieldForms(
//                 inputType: TextInputType.name,
//                 placeholder: widget.profState[0].fullname.toString().isNotEmpty
//                     ? widget.profState[0].fullname
//                     : 'Name',
//                 status: widget._status,
//               ),
//               ProfFieldForms(
//                   inputType: TextInputType.multiline,
//                   placeholder:
//                       //  widget.profState[0].gender.toString().isNotEmpty
//                       //     ? widget.profState[0].gender:
//                       'Gender',
//                   controller: genderController,
//                   status: widget._status),

//               ProfFieldForms(
//                   inputType: TextInputType.emailAddress,
//                   placeholder
//                       // : widget.profState[0].email.toString().isNotEmpty
//                       //     ? widget.profState[0].email
//                       : 'EmailAddress',
//                   controller: emailsController,
//                   status: widget._status),

//               // ! STAUS FOR EDITITNG
//               !widget._status
//                   ? Padding(
//                       padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
//                       child: widget.profState is ProfileLoadingState
//                           ? CupertinoActivityIndicator()
//                           : SingleBtn(
//                               btnName: 'Save',
//                               submitMethod: _profileBtn,
//                             ),
//                     )
//                   : new Container(),
//             ])),
//       ),
//     );
//   }
// }
