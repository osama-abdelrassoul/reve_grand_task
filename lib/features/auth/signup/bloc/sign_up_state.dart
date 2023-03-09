import 'package:equatable/equatable.dart';

enum SignupStatus {
  success,
  failure,
  loading,
}

class SignupState extends Equatable {
  const SignupState({
    this.id = '',
    this.message = '',
    this.status = SignupStatus.loading,
  });

  final String message;
  final SignupStatus status;

  final String id;

  SignupState copyWith({
    String? id,
    SignupStatus? status,
    String? message,
  }) {
    return SignupState(
      status: status ?? this.status,
      message: message ?? this.message,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [message, status, id];
}
