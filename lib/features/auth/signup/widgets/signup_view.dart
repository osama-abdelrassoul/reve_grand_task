import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utilities/utilities.dart';
import '../../common/custom_button.dart';
import '../../common/custom_text_field.dart';
import '../../common/top_bar_login.dart';
import '../bloc/sign_up_bloc.dart';
import '../bloc/sign_up_event.dart';
import '../bloc/sign_up_state.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _usernameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final _signUpFormKey = GlobalKey<FormState>();

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Form(
                key: _signUpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TopBarLogin(),
                    SizedBox(
                      height: Utilities.screenHeight * 0.15,
                    ),
                    CustomTextFeild(
                      controller: _usernameController,
                      hintText: 'User Name',
                    ),
                    const SizedBox(height: 30.0),
                    CustomTextFeild(
                        controller: _emailController, hintText: 'Email'),
                    const SizedBox(height: 30.0),
                    CustomTextFeild(
                        controller: _passwordController,
                        obsecure: true,
                        textInputType: TextInputType.visiblePassword,
                        hintText: 'Password'),
                    const SizedBox(height: 30.0),
                    const SizedBox(height: 30.0),
                    CustomButton(
                        text: 'Sign Up',
                        onTap: () {
                          if (_signUpFormKey.currentState!.validate()) {
                            context
                                .read<SignupBloc>()
                                .add(SignupButtonPressedEvent(
                                  emailController: _emailController,
                                  passwordController: _passwordController,
                                  usernameController: _usernameController,
                                ));
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
