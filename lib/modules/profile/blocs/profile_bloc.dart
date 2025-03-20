import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

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
  }
}
