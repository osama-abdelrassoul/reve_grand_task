import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reve_grand_tast/features/video_call/screens/index.dart';

import 'features/auth/login/bloc/login_bloc.dart';

import 'features/auth/login/screens/login_screen.dart';
import 'features/auth/signup/bloc/sign_up_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => LoginBloc()),
        BlocProvider<SignupBloc>(create: (context) => SignupBloc()),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}
