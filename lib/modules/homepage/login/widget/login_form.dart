import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_state.dart';
import 'package:heyyo_trip/blocs/auth/auth_event.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/common/widget/textfield.dart';
import 'package:heyyo_trip/modules/homepage/login/enum/login_enum.dart';
import 'package:heyyo_trip/modules/homepage/login/extension/login_extension.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  ValueNotifier<bool> isInputValid = ValueNotifier(false);

  final List<SocialType> socials = [
    SocialType.apple,
    SocialType.facebook,
    SocialType.binance,
    SocialType.google,
  ];

  @override
  void initState() {
    super.initState();
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    isInputValid.value =
        emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 50, bottom: 20),
          child: HeadingText(text: 'SIGN IN'),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: 320,
                height: 42,
                child: AppTextFormField(
                  prefixIcon: 'assets/icons/person.svg',
                  controller: emailController,
                  isPassword: false,
                  hintText: 'Email or phone number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email/phone number';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value) &&
                        !RegExp(r'^\d{10,11}\$').hasMatch(value)) {
                      return 'Please enter the right format';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                child: SizedBox(
                  width: 320,
                  height: 42,
                  child: AppTextFormField(
                    prefixIcon: 'assets/icons/lock.svg',
                    controller: passwordController,
                    isPassword: true,
                    hintText: 'Enter your password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: isInputValid,
                builder: (context, isReady, child) {
                  return Column(
                    children: [
                      SizedBox(
                        width: 320,
                        height: 48,
                        child: BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            bool isInputValid = emailController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty;
                            return PrimaryButton(
                              text: state is AuthLoading ? 'Loading...' : 'Sign In',
                              isReady: isInputValid && state is! AuthLoading,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                        LoginEvent(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context,
                                        ),
                                      );
                                }
                              },
                            );
                          },
                        ),
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthFailure) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Wrong email or password',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 16),
          child: SubHeadingText(text: 'or sign in with'),
        ),
        SizedBox(
          height: 40,
          width: 220,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
            ),
            itemCount: socials.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => socials[index].onTap(context),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: SvgPicture.asset(
                    socials[index].assetPath,
                    height: 40,
                    width: 40,
                  ),
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 10),
          child: LinkText(text: 'Forgot Password?'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BodyText(text: "Don't have an account?"),
            GestureDetector(
              onTap: () => GoRouter.of(context).push('/signup'),
              child: const LinkText(text: ' Sign Up'),
            ),
          ],
        )
      ],
    );
  }
}
