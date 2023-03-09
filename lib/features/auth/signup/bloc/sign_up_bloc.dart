import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cloud_firestore/cloud_firestore.dart';
import '../../../../core/models/user.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupState()) {
    on<SignupButtonPressedEvent>(_handleCreateAccountEvent);
  }

  Future<void> _handleCreateAccountEvent(
    SignupButtonPressedEvent event,
    Emitter<SignupState> emit,
  ) async {
    try {
      await fb.FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.emailController.text,
          password: event.passwordController.text);

      emit(state.copyWith(
          message: "Created successfully", status: SignupStatus.success));
      if (state.status == SignupStatus.success) {
        User user = User(
          email: event.emailController.text,
          id: fb.FirebaseAuth.instance.currentUser!.uid,
          name: event.usernameController.text,
        );
        await CloudFirestore().uploadUserData(user: user);
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: SignupStatus.failure));
    }
  }
}
