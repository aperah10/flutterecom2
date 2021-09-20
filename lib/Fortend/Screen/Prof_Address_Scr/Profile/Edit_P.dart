import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Afile/ListFile/StateList.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Profile/profile_bloc.dart';
import 'package:secd_ecom/Fortend/CusField/Aviatar_Pic.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/Drop_Down_C.dart';
import 'package:secd_ecom/Fortend/CusField/FormF.dart';

import 'ShowP.dart';

class ProfileEditScr extends StatelessWidget {
  static const routeName = '/edit-profile';
  ProfileEditScr({Key? key}) : super(key: key);

  //   // ! PRofile instance
  // //  ProductshowBloc prodBloc = ProductshowBloc(prodRespo: ProductDataRespo());
  // ProfileBloc prodBloc = ProfileBloc();

  // @override
  // void initState() {
  //   prodBloc = BlocProvider.of<ProfileBloc>(context);
  //   prodBloc.add(FetchProfileEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // print('this is listner ${state}');

          if (state is ProfileLoadingState) {
            Center(child: CircularProgressIndicator());
          }
          if (state is ProfileErrorState) {
            Center(child: Text(state.error.toString()));
          }
          if (state is ProfileSuccessState) {
            Navigator.of(context)
                .pushReplacementNamed(ProfileShowScr.routeName);
          }
        },
        child:
            BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          // print('this is builder ${state}');
          if (state is ProfileLoadedState) {
            print(state.profileData);
            return EditBody(profState: state.profileData);
          }

          return Center(child: CircularProgressIndicator());
        }),
      ),
    ));
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! EDIT PROFILE BODY                                    */
/* -------------------------------------------------------------------------- */

class EditBody extends StatefulWidget {
  dynamic profState;
  EditBody({Key? key, this.profState}) : super(key: key);

  @override
  _EditBodyState createState() => _EditBodyState();
}

class _EditBodyState extends State<EditBody> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  //  TextEditingController ? nameController ;
  //  TextEditingController ?  emailsController ;
  final genderController = TextEditingController();
  dynamic nameSaved;
  dynamic emailSaved;
  dynamic genderSaved;
  _profileBtn() async {
    var isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return "Enter the Correct Value";
    }
    formKey.currentState!.save();

    var isToken = BlocProvider.of<ProfileBloc>(context).add(
      ProfileSaveButtonEvent(
        // fullname: nameSaved.toString(),
        // email: emailSaved.toString(),
        fullname: nameController.text,
        email: emailController.text,
        gender: genderController.text.isNotEmpty
            ? genderController.text
            : widget.profState[0].gender,
        // gender: genderSaved.toString(),
      ),
    );
    // print(genderController.text.isEmpty ? 'yes is emptyh' : 'no is not empty');
    // print(genderController.value);
    // print('gender Sved $genderSaved');
    // print('nameSaved ${nameSaved}');
    // print('emailSaved ${emailSaved}');
    // print('nameController ${nameController.text}');
    // print('emailController ${emailController.text}');
  }

  /* -------------------------------------------------------------------------- */
  /*                             // ! END PROFILE BUTTON FORM                            */
  /* -------------------------------------------------------------------------- */

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                //  !  staring list item
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 15,
                ),

                // ! 2. AVATOR CIRCLE FOR PIC

                CusAvaitar2(),

                // ! Avitar Pic,

                SizedBox(
                  height: 35,
                ),

                //  ! FORM FILED WIDGET
                ProfFieldForms(
                  inValue: widget.profState[0].fullname.isNotEmpty
                      ? widget.profState[0].fullname
                      : '',
                  inputType: TextInputType.name,
                  // controller: nameController,
                  placeholder: 'Enter the Name',
                  // brd: false,
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      nameSaved = newValue;
                      nameController.text = nameSaved;
                      // print('thiis frm value ${nameSaved}');
                    });
                  },
                ),
                // !EMAIL FILE D
                ProfFieldForms(
                  inValue: widget.profState[0].email.toString().isNotEmpty
                      ? widget.profState[0].email.toString()
                      : '',
                  inputType: TextInputType.emailAddress,
                  // controller: emailController,
                  placeholder: 'Enter the Email',
                  // brd: false,
                  onValue: (String? newValue) {
                    // ! DROP DOWN MENU  dropdownValue
                    setState(() {
                      emailSaved = newValue;
                      emailController.text = emailSaved;
                    });
                  },
                ),

                DropDownBtn(
                  pageName: 'Gender',
                  dName: widget.profState[0].gender.toString().isNotEmpty
                      ? widget.profState[0].gender
                      : 'Gender',
                  listData: AllListData.genderData,
                  listController: genderController,
                  currentItem: widget.profState[0].gender.toString().isNotEmpty
                      ? widget.profState[0].gender
                      : null,
                  // // onValue:   ,
                ),

                // ! END FORM FIELD PAGE

                // orc BUTTON
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
                        child: widget.profState is ProfileLoadingState
                            ? CupertinoActivityIndicator()
                            : MultipleBtn(
                                btnName: 'Save',
                                submitMethod: _profileBtn,
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30.0, bottom: 0.0),
                        child: widget.profState is ProfileLoadingState
                            ? CupertinoActivityIndicator()
                            : MultipleBtn(
                                btnName: 'Canacl',
                                submitMethod: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      ProfileShowScr.routeName);
                                },
                              ),
                      ),
                    ])
              ],
            ),
          ),
        ));
  }

  /* -------------------------------------------------------------------------- */
  /*                              // ! Profile BUTTON                             */
  /* -------------------------------------------------------------------------- */

}
