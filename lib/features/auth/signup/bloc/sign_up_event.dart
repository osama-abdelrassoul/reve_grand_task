import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object?> get props => [];
}

class SignupButtonPressedEvent extends SignupEvent {
  const SignupButtonPressedEvent(
      {required this.passwordController,
      required this.usernameController,
      required this.emailController});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  @override
  List<Object> get props =>
      [emailController, passwordController, passwordController];
}
