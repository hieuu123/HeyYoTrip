import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_state.dart';
import 'package:heyyo_trip/common/widget/appbar.dart';
import 'package:heyyo_trip/modules/homepage/login/widget/login_form.dart'; // <-- import form mới

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}
