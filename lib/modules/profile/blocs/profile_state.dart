class ProfileState {
  final String name;
  final String email;
  final String phone;
  final String birth;
  final String gender;
  final String country;
  final String address;
  final String countryCode;

  ProfileState({
    required this.name,
    required this.email,
    required this.phone,
    required this.birth,
    required this.gender,
    required this.country,
    required this.address,
    required this.countryCode,
  });

  factory ProfileState.initial() {
    return ProfileState(
        name: 'Nguyen Trong Hieu',
        email: 'tronghieu@gmail.com',
        phone: '0987654321',
        birth: '06/01/2003',
        gender: 'Male',
        country: 'Vietnam',
        address: 'Buon Ma Thuot, Dak Lak, Vietnam',
        countryCode: 'VN');
  }

  ProfileState copyWith({
    String? name,
    String? email,
    String? phone,
    String? birth,
    String? gender,
    String? country,
    String? address,
    String? countryCode,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birth: birth ?? this.birth,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      address: address ?? this.address,
      countryCode: countryCode ?? this.countryCode,
    );
  }
}
