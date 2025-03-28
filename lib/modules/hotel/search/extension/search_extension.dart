import 'package:heyyo_trip/modules/hotel/search/enum/search_enum.dart';

extension RecentSearchExtension on RecentSearchEnum {
  String get title {
    switch (this) {
      case RecentSearchEnum.danang:
        return 'Da Nang';
      case RecentSearchEnum.hanoi:
        return 'Ha Noi';
      case RecentSearchEnum.hcm:
        return 'Ho Chi Minh';
      case RecentSearchEnum.hue:
        return 'Hue';
    }
  }

  String get time {
    switch (this) {
      case RecentSearchEnum.danang:
        return 'Jul 19, 2021 - Jul 30, 2021 ';
      case RecentSearchEnum.hanoi:
        return 'Jul 19, 2021 - Jul 30, 2021 ';
      case RecentSearchEnum.hcm:
        return 'Jul 19, 2021 - Jul 30, 2021 ';
      case RecentSearchEnum.hue:
        return 'Jul 19, 2021 - Jul 30, 2021 ';
    }
  }
}
