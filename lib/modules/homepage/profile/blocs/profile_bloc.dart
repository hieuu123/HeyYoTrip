import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:heyyo_trip/common/shared_prefs/shared_prefs_manager.dart';
import 'package:heyyo_trip/common/shared_prefs/user_model.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<UpdateProfile>((event, emit) async {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) {
        emit(state.copyWith(
          message: 'Không tìm thấy người dùng',
          isSuccess: false,
        ));
        return;
      }

      // Tách họ tên: từ cuối là firstName, phần còn lại là lastName
      final nameParts = event.name.trim().split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.last : '';
      final lastName = nameParts.length > 1
          ? nameParts.sublist(0, nameParts.length - 1).join(' ')
          : '';

      try {
        // 1. Cập nhật Firestore
        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          'firstName': firstName,
          'lastName': lastName,
          'email': event.email,
          'phone': event.phone,
          'birthDay': event.birth,
          'gender': event.gender,
          'country': event.country,
          'address': event.address,
          'countryCode': event.countryCode,
        });
        print("✅ Updated Firebase with name: $firstName $lastName");

        // 2. Cập nhật SharedPreferences (OOP)
        final updatedUser = UserModel(
            uid: uid,
            email: event.email,
            phone: event.phone,
            firstName: firstName,
            lastName: lastName,
            birthDay: event.birth,
            gender: event.gender,
            country: event.country,
            address: event.address,
            countryCode: event.countryCode);

        await PreferencesManager.saveUser(updatedUser);

        // 3. Cập nhật state local
        emit(state.copyWith(
          name: event.name,
          email: event.email,
          phone: event.phone,
          birth: event.birth,
          gender: event.gender,
          country: event.country,
          address: event.address,
          countryCode: event.countryCode,
          message: 'Cập nhật thông tin thành công!',
          isSuccess: true,
        ));
      } catch (e) {
        print("❌ Error updating profile: $e");
        emit(state.copyWith(
          message: 'Có lỗi xảy ra khi cập nhật thông tin',
          isSuccess: false,
        ));
      }
    });

    on<LoadProfileFromFirestore>((event, emit) async {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) return;

      try {
        final snapshot =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        final data = snapshot.data();

        if (data != null) {
          final name = '${data['lastName']} ${data['firstName']}';
          final email = data['email'] ?? '';
          final phone = data['phone'] ?? '';

          final userModel = UserModel(
            uid: uid,
            email: email,
            phone: phone,
            firstName: data['firstName'] ?? '',
            lastName: data['lastName'] ?? '',
            birthDay: data['birthDay'],
            gender: data['gender'],
            country: data['country'],
            address: data['address'],
            countryCode: data['countryCode'],
          );
          await PreferencesManager.saveUser(userModel);

          emit(state.copyWith(
            name: name,
            email: email,
            phone: phone,
            birth: userModel.birthDay ?? '',
            gender: userModel.gender ?? '',
            country: userModel.country ?? '',
            address: userModel.address ?? '',
            countryCode: userModel.countryCode ?? '',
          ));
        } else {
          print('⚠️ No data found for uid $uid, using default state.');
          emit(ProfileState.initial());
        }
      } catch (e) {
        print('❌ Error loading profile: $e');
        emit(ProfileState.initial());
      }
    });

    on<ClearProfileMessage>((event, emit) {
      emit(state.copyWith(
        message: null,
        isSuccess: null,
      ));
    });
  }
}
