part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object?> get props => [];
}

class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent(
      {required this.passwordController, required this.emailController});

  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  List<Object> get props => [emailController, passwordController];
}
