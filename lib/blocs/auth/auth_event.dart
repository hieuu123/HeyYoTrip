import 'package:flutter/material.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String phone;
  final String password;
  final BuildContext context;

  LoginEvent(
      {this.email = '',
      this.phone = '',
      this.password = '',
      required this.context});
}

class RegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;
  final BuildContext context;

  RegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
    required this.context,
  });
}

class LogoutEvent extends AuthEvent {}
