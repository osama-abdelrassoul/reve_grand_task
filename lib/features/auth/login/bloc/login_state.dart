part of 'login_bloc.dart';

enum LoginStatus {
  success,
  failure,
  loading,
}

class LoginState extends Equatable {
  const LoginState({
    this.message = 'Facebook',
    this.status = LoginStatus.loading,
  });

  final String message;

  final LoginStatus status;

  LoginState copyWith(
      {User? user, String? message, LoginStatus? status, String? place}) {
    return LoginState(
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [message, status];
}
