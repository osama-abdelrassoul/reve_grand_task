import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reve_grand_tast/features/video_call/screens/index.dart';

import '../../../../core/utilities/utilities.dart';

import '../../common/custom_button.dart';
import '../../common/custom_text_field.dart';
import '../../common/top_bar_login.dart';
import '../../signup/screens/signup_screen.dart';
import '../bloc/login_bloc.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final _signInFormKey = GlobalKey<FormState>();

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.success) {
          var snackBar = SnackBar(
            backgroundColor: Colors.black,
            content: Text(state.message),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const IndexScreen();
              },
            ),
            (_) => false,
          );
        }
        if (state.status == LoginStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const TopBarLogin(),
                  SizedBox(
                    height: Utilities.screenHeight * 0.15,
                  ),
                  Form(
                    key: _signInFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextFeild(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 30.0),
                        CustomTextFeild(
                          controller: _passwordController,
                          hintText: 'Password',
                          obsecure: true,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 30.0),
                        const SizedBox(height: 30.0),
                        CustomButton(
                            text: 'Log in',
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                    LoginButtonPressedEvent(
                                        emailController: _emailController,
                                        passwordController:
                                            _passwordController));
                              }
                            }),
                        const _CreateAccountButton()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Utilities().navigatTo(context: context, screen: const SignupScreen());
      },
      child: const Text(
        'Create Account',
        style: TextStyle(color: Colors.blueAccent),
      ),
    );
  }
}
