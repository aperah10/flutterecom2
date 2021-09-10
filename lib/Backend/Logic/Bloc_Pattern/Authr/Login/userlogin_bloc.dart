import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Authr/auth/userauthenticate_bloc.dart';

import 'package:secd_ecom/Backend/Respo/Authr/Reglogin_Respo.dart';

part 'userlogin_event.dart';
part 'userlogin_state.dart';

class UserloginBloc extends Bloc<UserloginEvent, UserloginState> {
  //  REPOSTIPRY FOR
  // final NewCustomUserLoginRespo userRepository;
  // final UserLoginStorage userLoginStorage;
  // final UserauthenticateBloc authenticationBloc;
  UserauthenticateBloc authenticationBloc = UserauthenticateBloc();
  CusRLRespo userRepository = CusRLRespo();

  // UserloginBloc(
  //     {required this.authenticationBloc, required this.userRepository})
  //     : super(UserloginInitial());

  UserloginBloc() : super(UserloginInitial());

  @override
  Stream<UserloginState> mapEventToState(
    UserloginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final usertoken = await userRepository.loginRespo(
            phone: event.phone, password: event.password);

        // print('this is user token in login bloc ${usertoken.runtimeType}');

        if (usertoken == true) {
          // authenticationBloc.add(LoggedIn(usertoken: usertoken));
          yield LoginSucccess();
        }
        yield UserloginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
