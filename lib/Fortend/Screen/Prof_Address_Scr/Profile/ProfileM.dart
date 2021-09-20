// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Porf_Address/Profile/profile_bloc.dart';

// import 'Profile.dart';
// import 'ShowP.dart';

// class ProfileScr extends StatefulWidget {
//   const ProfileScr({Key? key}) : super(key: key);

//   @override
//   _ProfileScrState createState() => _ProfileScrState();
// }

// class _ProfileScrState extends State<ProfileScr> {
//   //  ! PRODUCT BLOC INSTANCE
//   ProfileBloc profBloc = ProfileBloc();

//   @override
//   void initState() {
//     profBloc = BlocProvider.of<ProfileBloc>(context);
//     profBloc.add(FetchProfileEvent());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<ProfileBloc, ProfileState>(listener: (context, state) {
//       if (state is ProfileLoadingState) {
//         Center(child: CircularProgressIndicator());
//       }
//       if (state is ProfileErrorState) {
//         Center(child: Text(state.error.toString()));
//       }
//       if (state is ProfileSuccessState) {
//         Navigator.of(context).pushReplacementNamed(ProfileShowScr.routeName);
//       }
//     }, child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
//       // print("produc page state: $state");
//       if (state is ProfileLoadingState) {
//         return Scaffold(body: Center(child: CircularProgressIndicator()));
//       }
//       if (state is ProfileErrorState) {
//         Scaffold.of(context)
//           ..hideCurrentSnackBar()
//           ..showSnackBar(
//             SnackBar(
//               content: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [Text('Profile Failure'), Icon(Icons.error)],
//               ),
//               backgroundColor: Colors.red,
//             ),
//           );
//       }
//       if (state is ProfileLoadedState) {
//         return ProfileScr1(
//           profState: state.profileData,
//         );
//       }
//       return Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }));
//   }
// }
