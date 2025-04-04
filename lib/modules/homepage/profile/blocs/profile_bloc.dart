import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_event.dart';
import 'profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState.initial()) {
    on<UpdateProfile>((event, emit) {
      emit(state.copyWith(
        name: event.name,
        email: event.email,
        phone: event.phone,
        birth: event.birth,
        gender: event.gender,
        country: event.country,
        address: event.address,
        countryCode: event.countryCode,
      ));
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

          emit(state.copyWith(
            name: name,
            email: email,
            phone: phone,
          ));
        } else {
          print('⚠️ No data found for uid $uid, using default state.');
          emit(ProfileState.initial()); // fallback nếu không tìm thấy document
        }
      } catch (e) {
        print('❌ Error loading profile: $e');
        emit(ProfileState.initial()); // fallback nếu có lỗi khi fetch
      }
    });
  }
}
