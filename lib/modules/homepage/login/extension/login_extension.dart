import 'package:flutter/material.dart';
// import 'package:heyyo_trip/blocs/auth/auth_bloc.dart';
import 'package:heyyo_trip/common/shared_prefs/shared_prefs_manager.dart';
import 'package:heyyo_trip/common/shared_prefs/user_model.dart';
import 'package:heyyo_trip/common/widget/fullscreen_loader.dart';
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
      FullScreenLoader.show(context);
      final googleSignIn = GoogleSignIn(
        clientId: kIsWeb
            ? '273442563150-brpb42is5r4ev18gsle3t115n47aes6c.apps.googleusercontent.com'
            : null,
      );

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        FullScreenLoader.hide();
        return;
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;

      if (user == null) {
        FullScreenLoader.hide();
        return;
      }

      final uid = user.uid;
      final doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      String firstName = '';
      String lastName = '';
      String email = user.email ?? '';
      String phone = '';
      String birthDay = '';
      String gender = '';
      String country = '';
      String address = '';
      String countryCode = '';

      if (doc.exists) {
        final data = doc.data()!;
        firstName = data['firstName'] ?? '';
        lastName = data['lastName'] ?? '';
        email = data['email'] ?? '';
        phone = data['phone'] ?? '';
        birthDay = data['birthDay'] ?? '';
        gender = data['gender'] ?? '';
        country = data['country'] ?? '';
        address = data['address'] ?? '';
        countryCode = data['countryCode'] ?? '';
      } else {
        // Tạo user mới nếu chưa tồn tại
        final name = user.displayName ?? '';
        firstName = name.split(' ').last;
        lastName = name.split(' ').length > 1
            ? name.split(' ').sublist(0, name.split(' ').length - 1).join(' ')
            : '';

        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'email': email,
          'firstName': firstName,
          'lastName': lastName,
          'phone': '',
          'birthDay': '',
          'gender': '',
          'country': '',
          'address': '',
          'countryCode': '',
          'createdAt': FieldValue.serverTimestamp(),
        });
      }

      final userModel = UserModel(
        uid: uid,
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        birthDay: birthDay,
        gender: gender,
        country: country,
        address: address,
        countryCode: countryCode,
      );

      await PreferencesManager.saveUser(userModel);

      if (context.mounted) {
        context.read<ProfileBloc>().add(UpdateProfile(
              name: '$lastName $firstName',
              email: email,
              phone: phone,
              birth: birthDay,
              gender: gender,
              country: country,
              address: address,
              countryCode: countryCode,
            ));

        FullScreenLoader.hide();
        context.go('/');
      }
    } catch (e) {
      print('❌ Google login error: $e');
      FullScreenLoader.hide();
    }
  }
}
