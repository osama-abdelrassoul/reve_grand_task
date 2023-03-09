import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginButtonPressedEvent>(_handleLoginWithEmailAndPasswordEvent);
  }

  Future<void> _handleLoginWithEmailAndPasswordEvent(
    LoginButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await fb.FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.emailController.text,
          password: event.passwordController.text);

      emit(state.copyWith(
        message: 'logged in successfully',
        status: LoginStatus.success,
      ));
      if (state.status == LoginStatus.success) {}
    } on fb.FirebaseAuthException catch (e) {
      emit(state.copyWith(message: e.toString(), status: LoginStatus.failure));
    }
  }
}
