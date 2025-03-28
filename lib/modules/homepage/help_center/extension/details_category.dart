import 'package:heyyo_trip/modules/homepage/help_center/enum/help_center_enum.dart';

extension DetailsCategory on HelpCategories {
  String get detailsCategory1 {
    switch (this) {
      case HelpCategories.general:
        return 'Booking details1';
      case HelpCategories.hotel:
        return 'Booking details2';
      case HelpCategories.flight:
        return 'Booking details3';
      case HelpCategories.combo:
        return 'Booking details4';
      case HelpCategories.tour:
        return 'Booking details5';
    }
  }

  String get detailsCategory2 {
    switch (this) {
      case HelpCategories.general:
        return 'Cancellation, Refund and Exchange';
      case HelpCategories.hotel:
        return 'Cancellation, Refund and Exchange';
      case HelpCategories.flight:
        return 'Cancellation, Refund and Exchange';
      case HelpCategories.combo:
        return 'Cancellation, Refund and Exchange';
      case HelpCategories.tour:
        return 'Cancellation, Refund and Exchange';
    }
  }

  String get detailsCategory3 {
    switch (this) {
      case HelpCategories.general:
        return 'Process';
      case HelpCategories.hotel:
        return 'Process';
      case HelpCategories.flight:
        return 'Process';
      case HelpCategories.combo:
        return 'Process';
      case HelpCategories.tour:
        return 'Process';
    }
  }

  String get detailsCategory4 {
    switch (this) {
      case HelpCategories.general:
        return 'Schedule change';
      case HelpCategories.hotel:
        return 'Schedule change';
      case HelpCategories.flight:
        return 'Schedule change';
      case HelpCategories.combo:
        return 'Schedule change';
      case HelpCategories.tour:
        return 'Schedule change';
    }
  }

  String get detailsCategory5 {
    switch (this) {
      case HelpCategories.general:
        return 'All in one';
      case HelpCategories.hotel:
        return 'All in one';
      case HelpCategories.flight:
        return 'All in one';
      case HelpCategories.combo:
        return 'All in one';
      case HelpCategories.tour:
        return 'All in one';
    }
  }

  String get detailsCategory6 {
    switch (this) {
      case HelpCategories.general:
        return 'Baggage allowance';
      case HelpCategories.hotel:
        return 'Baggage allowance';
      case HelpCategories.flight:
        return 'Baggage allowance';
      case HelpCategories.combo:
        return 'Baggage allowance';
      case HelpCategories.tour:
        return 'Baggage allowance';
    }
  }

  String get detailsCategory7 {
    switch (this) {
      case HelpCategories.general:
        return 'Payment';
      case HelpCategories.hotel:
        return 'Payment';
      case HelpCategories.flight:
        return 'Payment';
      case HelpCategories.combo:
        return 'Payment';
      case HelpCategories.tour:
        return '';
    }
  }

  String get detailsCategory8 {
    switch (this) {
      case HelpCategories.general:
        return 'Only General';
      case HelpCategories.hotel:
        return '';
      case HelpCategories.flight:
        return '';
      case HelpCategories.combo:
        return '';
      case HelpCategories.tour:
        return '';
    }
  }

  String getDetailsCategoryByIndex(int index) {
    switch (index) {
      case 1:
        return detailsCategory1;
      case 2:
        return detailsCategory2;
      case 3:
        return detailsCategory3;
      case 4:
        return detailsCategory4;
      case 5:
        return detailsCategory5;
      case 6:
        return detailsCategory6;
      case 7:
        return detailsCategory7;
      case 8:
        return detailsCategory8;
      default:
        return '';
    }
  }

  int get totalCategories {
    int count = 0;
    int index = 1;
    while (getDetailsCategoryByIndex(index).isNotEmpty) {
      count++;
      index++;
    }
    return count;
  }
}
