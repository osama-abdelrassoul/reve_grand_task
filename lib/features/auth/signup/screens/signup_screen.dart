import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/utilities.dart';

import '../../login/screens/login_screen.dart';
import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_state.dart';
import '../widgets/signup_view.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          SignupBloc();
          if (state.status == SignupStatus.success) {
            Utilities()
                    .navigatTo(context: context, screen: const LoginScreen()) &
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.black,
                  content: Text(state.message),
                ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.black,
              content: Text(state.message),
            ));
          }
        },
        child: const SignUpView());
  }
}
