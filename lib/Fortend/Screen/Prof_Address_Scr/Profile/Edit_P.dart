import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Profile/profile_bloc.dart';
import 'package:secd_ecom/Fortend/CusField/Aviatar_Pic.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/FormF.dart';

import 'ShowP.dart';

class ProfileEditScr extends StatelessWidget {
  static const routeName = '/edit-profile';
  ProfileEditScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) {
          print('this is listner ${state}');

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
          print('this is builder ${state}');
          if (state is ProfileLoadedState) {
            print(state.profileData);
            return EditBody(profState: state.profileData);
          }
          // if (state is ProfileLoadedState) {
          //   Center(child: Text('${state.profileData}'));
          // }

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
  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailsController = TextEditingController();
  final genderController = TextEditingController();
  /* -------------------------------------------------------------------------- */
  /*                              // ! Profile BUTTON                             */
  /* -------------------------------------------------------------------------- */
  _profileBtn() async {
    var isvalid = _form.currentState!.validate();
    if (!isvalid) {
      return "Enter the Correct Value";
    }
    _form.currentState!.save();

    var isToken = BlocProvider.of<ProfileBloc>(context).add(
      ProfileSaveButtonEvent(
          fullname: nameController.text,
          email: emailsController.text,
          gender: genderController.text),
    );
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
            key: _form,
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
                FieldF(
                  inputType: TextInputType.name,
                  controller: nameController,
                  placeholder: 'Enter the Name',
                  brd: false,
                ),
                FieldF(
                  inputType: TextInputType.emailAddress,
                  controller: emailsController,
                  placeholder: 'Enter the Email',
                  brd: false,
                ),
                FieldF(
                  inputType: TextInputType.name,
                  controller: genderController,
                  placeholder: 'Enter the Gender',
                  brd: false,
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
}
