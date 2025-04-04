import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heyyo_trip/common/widget/appbar.dart';
import 'package:heyyo_trip/common/widget/button.dart';
import 'package:heyyo_trip/common/widget/text.dart';
import 'package:heyyo_trip/common/widget/textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/blocs/auth/auth_state.dart';
import 'package:heyyo_trip/blocs/auth/auth_event.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  ValueNotifier<bool> isInputValid = ValueNotifier(false);
  final _focusNodes = {
    'firstName': FocusNode(),
    'lastName': FocusNode(),
    'email': FocusNode(),
    'phone': FocusNode(),
    'password': FocusNode(),
    'confirmPassword': FocusNode(),
  };

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(updateButtonState);
    lastNameController.addListener(updateButtonState);
    emailController.addListener(updateButtonState);
    phoneController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
    confirmPasswordController.addListener(updateButtonState);
    
    // Set focus ban đầu cho trường firstName
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes['firstName']?.requestFocus();
    });
  }

  @override
  void dispose() {
    _focusNodes.values.forEach((node) => node.dispose());
    super.dispose();
  }

  void updateButtonState() {
    isInputValid.value = firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8 || value.length > 20) {
      return 'Password must be between 8-20 characters';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least 1 number';
    }
    if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return 'Password must contain at least 1 letter';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least 1 special symbol';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go('/');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const SignInAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: HeadingText(text: 'SIGN UP'),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: maxWidth - 60,
                          height: 42,
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 42,
                                  child: AppTextFormField(
                                    hasPrefix: false,
                                    controller: firstNameController,
                                    isPassword: false,
                                    hintText: 'First Name',
                                    textInputAction: TextInputAction.next,
                                    focusNode: _focusNodes['firstName'],
                                    onFieldSubmitted: (_) {
                                      _focusNodes['lastName']?.requestFocus();
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your first name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  height: 42,
                                  child: AppTextFormField(
                                    hasPrefix: false,
                                    controller: lastNameController,
                                    isPassword: false,
                                    hintText: 'Last Name',
                                    textInputAction: TextInputAction.next,
                                    focusNode: _focusNodes['lastName'],
                                    onFieldSubmitted: (_) {
                                      _focusNodes['email']?.requestFocus();
                                    },
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your last name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: maxWidth - 60,
                          height: 42,
                          child: AppTextFormField(
                            hasPrefix: false,
                            controller: emailController,
                            isPassword: false,
                            hintText: 'Email',
                            textInputAction: TextInputAction.next,
                            focusNode: _focusNodes['email'],
                            onFieldSubmitted: (_) {
                              _focusNodes['phone']?.requestFocus();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                  .hasMatch(value)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: maxWidth - 60,
                          height: 42,
                          child: AppTextFormField(
                            hasPrefix: false,
                            controller: phoneController,
                            isPassword: false,
                            hintText: 'Phone Number',
                            textInputAction: TextInputAction.next,
                            focusNode: _focusNodes['phone'],
                            onFieldSubmitted: (_) {
                              _focusNodes['password']?.requestFocus();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              } else if (!RegExp(r'^\d{10,11}$')
                                  .hasMatch(value)) {
                                return 'Please enter a valid phone number';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: maxWidth - 60,
                          height: 42,
                          child: AppTextFormField(
                            hasPrefix: false,
                            controller: passwordController,
                            isPassword: true,
                            hintText: 'Enter your password',
                            textInputAction: TextInputAction.next,
                            focusNode: _focusNodes['password'],
                            onFieldSubmitted: (_) {
                              _focusNodes['confirmPassword']?.requestFocus();
                            },
                            validator: validatePassword,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(
                          width: maxWidth - 60,
                          height: 42,
                          child: AppTextFormField(
                            hasPrefix: false,
                            controller: confirmPasswordController,
                            isPassword: true,
                            hintText: 'Confirm password',
                            textInputAction: TextInputAction.done,
                            focusNode: _focusNodes['confirmPassword'],
                            onFieldSubmitted: (_) {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                      RegisterEvent(
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        phone: phoneController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              }
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: maxWidth - 60,
                        child: const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: BodyText(
                            text:
                                'Passwords must be 8-20 characters with at least 1 number, 1 letter and 1 special symbol.',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: ValueListenableBuilder(
                          valueListenable: isInputValid,
                          builder: (context, isReady, child) {
                            return Column(
                              children: [
                                SizedBox(
                                  width: maxWidth - 60,
                                  height: 48,
                                  child: BlocBuilder<AuthBloc, AuthState>(
                                    builder: (context, state) {
                                      return PrimaryButton(
                                        text: state is AuthLoading
                                            ? 'Loading...'
                                            : 'Create an account',
                                        isReady: isReady && state is! AuthLoading,
                                        onPressed: () {
                                          if (_formKey.currentState!.validate()) {
                                            context.read<AuthBloc>().add(
                                                  RegisterEvent(
                                                    firstName:
                                                        firstNameController.text,
                                                    lastName:
                                                        lastNameController.text,
                                                    email: emailController.text,
                                                    phone: phoneController.text,
                                                    password:
                                                        passwordController.text,
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
                                          'Email already in use',
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
