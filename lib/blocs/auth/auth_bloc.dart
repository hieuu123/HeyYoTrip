import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heyyo_trip/common/shared_prefs/shared_prefs_manager.dart';
import 'package:heyyo_trip/common/shared_prefs/user_model.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_event.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';

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

        final uid = credential.user?.uid;
        if (uid != null) {
          final doc = await FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .get();

          if (doc.exists) {
            final data = doc.data();
            final fullName =
                '${data?['lastName'] ?? ''} ${data?['firstName'] ?? ''}';
            final email = data?['email'] ?? '';
            final phone = data?['phone'] ?? '';

            final user = UserModel(
              uid: uid,
              email: email,
              firstName: data?['firstName'] ?? '',
              lastName: data?['lastName'] ?? '',
              phone: phone,
            );

            await PreferencesManager.saveUser(user);

            if (event.context.mounted) {
              event.context.read<ProfileBloc>().add(UpdateProfile(
                    name: fullName,
                    email: email,
                    phone: phone,
                    birth: '06/01/2003',
                    gender: 'Male',
                    country: 'Vietnam',
                    address: 'Buon Ma Thuot, Dak Lak, Vietnam',
                    countryCode: 'VN',
                  ));
            }
          } else {
            if (event.context.mounted) {
              event.context.read<ProfileBloc>().add(UpdateProfile(
                    name: 'Nguyen Trong Hieu',
                    email: 'tronghieu@gmail.com',
                    phone: '0987654321',
                    birth: '06/01/2003',
                    gender: 'Male',
                    country: 'Vietnam',
                    address: 'Buon Ma Thuot, Dak Lak, Vietnam',
                    countryCode: 'VN',
                  ));
            }
          }
        }

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

          final user = UserModel(
            uid: uid,
            email: event.email,
            firstName: event.firstName,
            lastName: event.lastName,
            phone: event.phone,
          );

          await PreferencesManager.saveUser(user);

          // ✅ Update ProfileBloc tại đây
          if (event.context.mounted) {
            event.context.read<ProfileBloc>().add(UpdateProfile(
                  name: '${event.lastName} ${event.firstName}',
                  email: event.email,
                  phone: event.phone,
                  birth: '06/01/2003',
                  gender: 'Male',
                  country: 'Vietnam',
                  address: 'Buon Ma Thuot, Dak Lak, Vietnam',
                  countryCode: 'VN',
                ));
          }

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
    on<LogoutEvent>((event, emit) async {
      await PreferencesManager.clearUser();
      await FirebaseAuth.instance.signOut();
      emit(AuthLoggedOut());
    });
  }
}
