abstract class ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String name;
  final String email;
  final String phone;
  final String birth;
  final String gender;
  final String country;
  final String address;
  final String countryCode;

  UpdateProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.birth,
    required this.gender,
    required this.country,
    required this.address,
    required this.countryCode,
  });
}

class LoadProfileFromFirestore extends ProfileEvent {}

class ShowUpdateProfileMessage extends ProfileEvent {
  final String message;
  final bool isSuccess;

  ShowUpdateProfileMessage({
    required this.message,
    required this.isSuccess,
  });
}

class ClearProfileMessage extends ProfileEvent {}

