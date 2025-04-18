import 'package:heyyo_trip/modules/flight/search/enum/search_enum.dart';

extension RecentSearchExtension on RecentSearch {
  String get from {
    switch (this) {
      case RecentSearch.search1:
        return 'Hồ Chí Minh (SGN)';
      case RecentSearch.search2:
        return 'Hồ Chí Minh (SGN)';
      case RecentSearch.search3:
        return 'Hồ Chí Minh (SGN)';
      case RecentSearch.search4:
        return 'Hồ Chí Minh (SGN)';
    }
  }

  String get to {
    switch (this) {
      case RecentSearch.search1:
        return 'Hà Nội (HAN)';
      case RecentSearch.search2:
        return 'Hà Nội (HAN)';
      case RecentSearch.search3:
        return 'Hà Nội (HAN)';
      case RecentSearch.search4:
        return 'Hà Nội (HAN)';
    }
  }

  String get time {
    switch (this) {
      case RecentSearch.search1:
        return 'May 06, 2022 - May 08. 2022';
      case RecentSearch.search2:
        return 'May 06, 2022 - May 08. 2022';
      case RecentSearch.search3:
        return 'May 06, 2022 - May 08. 2022';
      case RecentSearch.search4:
        return 'May 06, 2022 - May 08. 2022';
    }
  }

  Map<String, int> get people {
    switch (this) {
      case RecentSearch.search1:
        return {'adult': 2, 'children': 0, 'infant': 0};
      case RecentSearch.search2:
        return {'adult': 2, 'children': 0, 'infant': 0};
      case RecentSearch.search3:
        return {'adult': 2, 'children': 0, 'infant': 0};
      case RecentSearch.search4:
        return {'adult': 2, 'children': 0, 'infant': 0};
    }
  }

  int get count {
    return RecentSearch.values.length;
  }
}

extension PopularCitiesCountryExtension on PopularCitiesCountry {
  List<Map<String, String>> get details {
    switch (this) {
      case PopularCitiesCountry.vietnam:
        return [
          {'title': 'Hanoi', 'code': 'HAN'},
          {'title': 'Thanh Hoa', 'code': 'THD'},
          {'title': 'Hue', 'code': 'HUI'},
          {'title': 'Qui Nhon', 'code': 'UIH'},
          {'title': 'Phu Quoc', 'code': 'PQC'},
          {'title': 'Ho Chi Minh', 'code': 'SGN'},
        ];
    }
  }

  String get country {
    switch (this) {
      case PopularCitiesCountry.vietnam:
        return 'Vietnam';
    }
  }
}
