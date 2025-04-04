abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String phone;
  final String password;

  LoginEvent({this.email = '', this.phone = '', this.password = ''});
}

class RegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String password;

  RegisterEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phone,
      required this.password});
}

class LogoutEvent extends AuthEvent {}
