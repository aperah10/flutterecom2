import 'package:flutter/material.dart';
import 'package:secd_ecom/Fortend/CusField/Aviatar_Pic.dart';
import 'package:secd_ecom/Fortend/CusField/Buttons_C.dart';
import 'package:secd_ecom/Fortend/CusField/FormF.dart';
import 'package:secd_ecom/Fortend/Widget/Appbar/CusAppbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Profile/profile_bloc.dart';

import 'Edit_P.dart';

class ProfileShowScr extends StatelessWidget {
  static const routeName = '/showp-profilepage in ';
  ProfileShowScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleName: 'Profile Page '),
      body: SafeArea(
        bottom: false,
        left: true,
        right: true,
        top: false,
        child: ProfileOne(),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! PROFILE BODY                             */
/* -------------------------------------------------------------------------- */
class ProfileOne extends StatefulWidget {
  ProfileOne({Key? key}) : super(key: key);

  @override
  _ProfileOneState createState() => _ProfileOneState();
}

class _ProfileOneState extends State<ProfileOne> {
  // ! PRofile instance
  //  ProductshowBloc prodBloc = ProductshowBloc(prodRespo: ProductDataRespo());
  ProfileBloc prodBloc = ProfileBloc();

  @override
  void initState() {
    prodBloc = BlocProvider.of<ProfileBloc>(context);
    prodBloc.add(FetchProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        // print('this is listner ${state}');

        if (state is ProfileLoadingState) {
          Center(child: CircularProgressIndicator());
        }
        if (state is ProfileErrorState) {
          Center(child: Text(state.error.toString()));
        }
        // if (state is ProfileLoadedState) {
        //   Center(child: Text('LISTENER:- ${state.profileData}'));
        // }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        // print('this is builder ${state}');
        if (state is ProfileLoadedState) {
          print(state.profileData);
          return ProfileShow(profState: state.profileData);
        }
        // if (state is ProfileLoadedState) {
        //   Center(child: Text('${state.profileData}'));
        // }

        return Center(child: CircularProgressIndicator());
      }),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              // ! PROFILE SHOW                             */
/* -------------------------------------------------------------------------- */
class ProfileShow extends StatelessWidget {
  dynamic profState;
  ProfileShow({Key? key, this.profState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            // FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                //  !  staring list item
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ProfileEditScr.routeName);
                  },
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),

                // ! 2. AVATOR CIRCLE FOR PIC

                CusAvaitar2(
                  submitMethod: () {
                    Navigator.of(context)
                        .pushReplacementNamed(ProfileEditScr.routeName);
                  },
                ),

                // ! Avitar Pic,

                SizedBox(
                  height: 35,
                ),

                //  ! FORM FILED WIDGET
                FieldForms(
                  placeholder: profState[0].fullname != null
                      ? profState[0].fullname
                      : 'Name',
                ),
                FieldForms(
                  placeholder:
                      profState[0].email != null ? profState[0].email : 'Email',
                ),
                FieldForms(
                  placeholder: profState[0].gender != null
                      ? profState[0].gender
                      : 'Gender',
                ),
              ],
            ),
          ),
        ));
  }
}
