import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    // Xử lý sự kiện Login
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(AuthSuccess('Login successful!'));
      } on FirebaseAuthException catch (e) {
        emit(AuthFailure(e.message ?? 'Login failed'));
      } catch (e) {
        emit(AuthFailure('An unexpected error occurred: $e'));
      }
    });

    // Xử lý sự kiện Register
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());

      try {
        // 1. Tạo tài khoản trên Firebase Auth
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );

        final uid = userCredential.user?.uid;

        if (uid == null) {
          emit(AuthFailure('User ID is null'));
          return;
        }

        // 2. Lưu thông tin user vào Firestore
        try {
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            'firstName': event.firstName,
            'lastName': event.lastName,
            'email': event.email,
            'phone': event.phone,
            'createdAt': FieldValue.serverTimestamp(),
          });

          print("✅ Firestore write successful for UID: $uid");

          emit(AuthSuccess('Registration successful!'));
        } catch (e) {
          print("❌ Firestore write error: $e");
          emit(AuthFailure('Registered but failed to save to database.'));
        }
      } on FirebaseAuthException catch (e) {
        print("❌ Auth error: ${e.message}");
        emit(AuthFailure(e.message ?? 'Sign up failed'));
      } catch (e) {
        print("❌ Unexpected error: $e");
        emit(AuthFailure('Unexpected error: $e'));
      }
    });

    // Xử lý sự kiện Logout
    on<LogoutEvent>((event, emit) {
      emit(AuthLoggedOut());
    });
  }
}
