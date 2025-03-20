import 'package:heyyo_trip/modules/profile/enum/profile_enum.dart';

extension ProfileExtension on ProfileEnum {
  String get title {
    switch (this) {
      case ProfileEnum.name:
        return 'Name';
      case ProfileEnum.email:
        return 'Email address';
      case ProfileEnum.phone:
        return 'Phone number';
      case ProfileEnum.birth:
        return 'Date of birth';
      case ProfileEnum.gender:
        return 'Gender';
      case ProfileEnum.country:
        return 'Country';
      case ProfileEnum.address:
        return 'Address';
    }
  }

  String get value {
    switch (this) {
      case ProfileEnum.name:
        return 'Nguyen Trong Hieu';
      case ProfileEnum.email:
        return 'tronghieu@gmail.com';
      case ProfileEnum.phone:
        return '0987654321';
      case ProfileEnum.birth:
        return '06/01/2003';
      case ProfileEnum.gender:
        return 'Male';
      case ProfileEnum.country:
        return 'Vietnam';
      case ProfileEnum.address:
        return 'Buon Ma Thuat, Dak Lak, Vietnam';
    }
  }
}
