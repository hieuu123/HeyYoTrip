import 'package:flutter/material.dart';
// import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/common/shared_prefs/shared_prefs_manager.dart';
import 'package:heyyo_trip/common/shared_prefs/user_model.dart';
import 'package:heyyo_trip/modules/homepage/login/enum/login_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_bloc.dart';
import 'package:heyyo_trip/modules/homepage/profile/blocs/profile_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension SocialTypeExtension on SocialType {
  String get assetPath {
    switch (this) {
      case SocialType.apple:
        return 'assets/icons/apple.svg';
      case SocialType.facebook:
        return 'assets/icons/facebook.svg';
      case SocialType.binance:
        return 'assets/icons/binance.svg';
      case SocialType.google:
        return 'assets/icons/g+.svg';
    }
  }

  void onTap(BuildContext context) {
    switch (this) {
      case SocialType.apple:
        _handleAppleLogin(context);
        break;
      case SocialType.facebook:
        _handleFacebookLogin(context);
        break;
      case SocialType.binance:
        _handleBinanceLogin(context);
        break;
      case SocialType.google:
        _handleGoogleLogin(context);
        break;
    }
  }

  void _handleAppleLogin(BuildContext context) {
    // TODO: Implement Apple login logic
    print('Apple login clicked');
  }

  void _handleFacebookLogin(BuildContext context) {
    // TODO: Implement Facebook login logic
    print('Facebook login clicked');
  }

  void _handleBinanceLogin(BuildContext context) {
    // TODO: Implement Binance login logic
    print('Binance login clicked');
  }

  void _handleGoogleLogin(BuildContext context) async {
    try {
      final googleSignIn = GoogleSignIn(
        clientId: kIsWeb
            ? '273442563150-brpb42is5r4ev18gsle3t115n47aes6c.apps.googleusercontent.com'
            : null,
      );

      // 1. Chọn tài khoản Google
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return; // Người dùng cancel

      // 2. Lấy token xác thực
      final googleAuth = await googleUser.authentication;

      // 3. Tạo credential để đăng nhập Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 4. Đăng nhập Firebase bằng Google
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) return;

      final uid = user.uid;
      final email = user.email ?? '';
      final name = user.displayName ?? '';
      final firstName = name.split(' ').last;
      final lastName = name.split(' ').length > 1
          ? name.split(' ').sublist(0, name.split(' ').length - 1).join(' ')
          : '';

      // 5. Nếu là người dùng mới, lưu thông tin vào Firestore
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (!doc.exists) {
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'phone': '',
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      // 6. Lưu vào SharedPreferences
      final userModel = UserModel(
        uid: uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: '',
      );
      await PreferencesManager.saveUser(userModel);

      // 7. Update ProfileBloc
      if (context.mounted) {
        context.read<ProfileBloc>().add(UpdateProfile(
              name: '$lastName $firstName',
              email: email,
              phone: '',
              birth: '06/01/2003',
              gender: 'Male',
              country: 'Vietnam',
              address: 'Buon Ma Thuot, Dak Lak, Vietnam',
              countryCode: 'VN',
            ));

        // 8. Điều hướng về home
        context.go('/');
      }
    } catch (e) {
      print('❌ Google login error: $e');
    }
  }
}
