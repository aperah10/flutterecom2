import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:secd_ecom/Backend/Logic/Bloc_Pattern/Authr/auth/userauthenticate_bloc.dart';
import 'package:secd_ecom/Backend/Respo/Authr/Reglogin_Respo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  // final NewCustomUserLoginRespo userRepository;
  // final UserauthenticateBloc authenticationBloc;

  UserauthenticateBloc authenticationBloc = UserauthenticateBloc();
  CusRLRespo userRepository = CusRLRespo();
  // RegisterBloc({required this.userRepository, required this.authenticationBloc})
  //     : super(RegisterInitial());
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is SignUpButtonPressed) {
      yield RegisterLoading();

      try {
        var user = await userRepository.regRespo(
            email: event.email,
            phone: event.phone,
            fullname: event.fullname,
            password: event.password);
        // print('this is Register token RUNTYPE : -  ${user.runtimeType}');
        if (user == true) {
          // authenticationBloc.add(SignedIn(regtoken: user));
          // yield RegisterSucced(user: user);
          yield RegisterSucced();
        }
        yield RegisterInitial();
      } catch (e) {
        // Scaffold(
        //   body: Center(
        //     child: Text(e.toString()),
        //   ),
        // );
        yield RegisterFailed(message: e.toString());
      }
    }
  }
}
