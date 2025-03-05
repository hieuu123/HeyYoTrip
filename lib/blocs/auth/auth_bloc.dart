import 'package:flutter_bloc/flutter_bloc.dart';

// Import event và state
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // Xử lý sự kiện Login
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      
      try {
        // Validate email
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email) && 
            !RegExp(r'^\d{10,11}$').hasMatch(event.email)) {
          emit(AuthFailure('Invalid email format or phone number'));
          return;
        }

        // Validate password
        if (event.password.length < 6) {
          emit(AuthFailure('Password must be at least 6 characters'));
          return;
        }
        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(event.password)) {
          emit(AuthFailure('Password must contain at least 1 special character'));
          return;
        }

        // Giả lập API call
        await Future.delayed(const Duration(seconds: 1));
        
        // Kiểm tra thông tin đăng nhập
        if (event.email == 'admin@gmail.com' && event.password == 'admin@123') {
          emit(AuthSuccess('Login successful!'));
        } else {
          emit(AuthFailure('Invalid credentials'));
        }
      } catch (e) {
        emit(AuthFailure('An error occurred: $e'));
      }
    });

    // Xử lý sự kiện Register
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 1)); // Giả lập API delay
      if (event.email == 'admin' && event.password == 'admin123') {
        emit(AuthSuccess('Registration successful!'));
      } else {
        emit(AuthFailure('Username or password does not meet requirements'));
      }
    });

    // Xử lý sự kiện Logout
    on<LogoutEvent>((event, emit) {
      emit(AuthLoggedOut());
    });
  }
}