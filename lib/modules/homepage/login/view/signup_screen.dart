import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_state.dart';
import 'package:heyyo_trip/common/widget/appbar.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/modules/homepage/login/widget/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go('/');
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.white,
        appBar: SignInAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: HeadingText(text: 'SIGN UP'),
                ),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
