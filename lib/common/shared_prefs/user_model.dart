class UserModel {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final String? birthDay;
  final String? gender;
  final String? country;
  final String? address;
  final String? countryCode;


  UserModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.birthDay,
    this.gender,
    this.country,
    this.address,
    this.countryCode,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phone: json['phone'] ?? '',
      birthDay: json['birthDay'],
      gender: json['gender'],
      country: json['country'],
      address: json['address'],
      countryCode: json['countryCode']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'birthDay': birthDay,
      'gender': gender,
      'country': country,
      'address': address,
      'countryCode': countryCode
    };
  }
}
