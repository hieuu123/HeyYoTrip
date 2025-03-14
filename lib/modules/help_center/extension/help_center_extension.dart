// import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/help_center/enum/help_center_enum.dart';

extension HelpCategoryExtension on HelpCategories {
  String get icon1 {
    switch (this) {
      case HelpCategories.general:
        return 'assets/icons/help-round.svg';
      case HelpCategories.hotel:
        return 'assets/icons/help-hotel.svg';
      case HelpCategories.flight:
        return 'assets/icons/help-flight.svg';
      case HelpCategories.combo:
        return 'assets/icons/help-fh-combo.svg';
      case HelpCategories.tour:
        return 'assets/icons/help-tour.svg';
    }
  }

  String get icon2 {
    switch (this) {
      case HelpCategories.general:
        return 'assets/icons/help-globe.svg';
      case HelpCategories.hotel:
        return 'assets/icons/help-hotel.svg';
      case HelpCategories.flight:
        return 'assets/icons/help-flight.svg';
      case HelpCategories.combo:
        return 'assets/icons/help-fh-combo.svg';
      case HelpCategories.tour:
        return 'assets/icons/help-tour.svg';
    }
  }

  String get title {
    switch (this) {
      case HelpCategories.general:
        return 'General information';
      case HelpCategories.hotel:
        return 'Hotel';
      case HelpCategories.flight:
        return 'Flight';
      case HelpCategories.combo:
        return 'F&H Combo';
      case HelpCategories.tour:
        return 'Tour';
    }
  }

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

  String getQuestionByIndex(int index) {
    switch (index) {
      case 1:
        return detailsQuestion1;
      case 2:
        return detailsQuestion2;
      case 3:
        return detailsQuestion3;
      case 4:
        return detailsQuestion4;
      case 5:
        return detailsQuestion5;
      case 6:
        return detailsQuestion6;
      case 7:
        return detailsQuestion7;
      case 8:
        return detailsQuestion8;
      case 9:
        return detailsQuestion9;
      case 10:
        return detailsQuestion10;
      case 11:
        return detailsQuestion11;
      case 12:
        return detailsQuestion12;
      case 13:
        return detailsQuestion13;
      case 14:
        return detailsQuestion14;
      case 15:
        return detailsQuestion15;
      case 16:
        return detailsQuestion16;
      case 17:
        return detailsQuestion17;
      default:
        return '';
    }
  }

  String getAnswerByIndex(int index) {
    switch (index) {
      case 1:
        return detailsAnswer1;
      default:
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

  /// Danh sách index câu hỏi cho từng `detailsCategory`
  List<List<int>> get questionIndexes {
    switch (this) {
      case HelpCategories.general:
        return [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          [10],
          [11, 12, 13],
          [14, 15],
          [16, 17],
          [16, 17]
        ];
      case HelpCategories.hotel:
        return [
          [1, 2],
          [4, 5],
          [7, 8, 9],
          [10],
          [11, 12, 13],
          [14, 15],
          [16, 17],
        ];
      case HelpCategories.flight:
        return [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          [10],
          [11, 12, 13],
          [14, 15],
          [16, 17],
        ];
      case HelpCategories.combo:
        return [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          [10],
          [11, 12, 13],
          [14, 15],
          [16, 17],
        ];
      case HelpCategories.tour:
        return [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          [10],
          [11, 12, 13],
          [14, 15],
          // [16, 17],
        ];
      default:
        return [];
    }
  }

  /// Lấy danh sách câu hỏi của một `detailsCategory`
  List<int> getQuestionIndexes(int categoryIndex) {
    if (categoryIndex - 1 < questionIndexes.length) {
      return questionIndexes[categoryIndex - 1];
    }
    return [];
  }

  /// Lấy `startIndex` từ danh sách câu hỏi
  int getStartIndex(int categoryIndex) {
    List<int> indexes = getQuestionIndexes(categoryIndex);
    return indexes.isNotEmpty
        ? indexes.first
        : 1; // Lấy câu hỏi đầu tiên nếu có
  }

  /// Lấy `endIndex` từ danh sách câu hỏi
  int getEndIndex(int categoryIndex) {
    List<int> indexes = getQuestionIndexes(categoryIndex);
    return indexes.isNotEmpty
        ? indexes.last
        : 1; // Lấy câu hỏi cuối cùng nếu có
  }

  String get detailsQuestion1 {
    switch (this) {
      case HelpCategories.general:
        return 'How can I cancel my flight ticket1?';
      case HelpCategories.hotel:
        return 'How can I cancel my flight ticket2?';
      case HelpCategories.flight:
        return 'How can I cancel my flight ticket3?';
      case HelpCategories.combo:
        return 'How can I cancel my flight ticket4?';
      case HelpCategories.tour:
        return 'How can I cancel my flight ticket5?';
    }
  }

  String get detailsQuestion2 {
    switch (this) {
      case HelpCategories.general:
        return 'I want to change my booking date. How can I do that?';
      case HelpCategories.hotel:
        return 'I want to change my booking date. How can I do that?';
      case HelpCategories.flight:
        return 'I want to change my booking date. How can I do that?';
      case HelpCategories.combo:
        return 'I want to change my booking date. How can I do that?';
      case HelpCategories.tour:
        return 'I want to change my booking date. How can I do that?';
    }
  }

  String get detailsQuestion3 {
    switch (this) {
      case HelpCategories.general:
        return 'How can I cancel my booking?';
      case HelpCategories.hotel:
        return 'How can I cancel my booking?';
      case HelpCategories.flight:
        return 'How can I cancel my booking?';
      case HelpCategories.combo:
        return 'How can I cancel my booking?';
      case HelpCategories.tour:
        return 'How can I cancel my booking?';
    }
  }

  String get detailsQuestion4 {
    switch (this) {
      case HelpCategories.general:
        return 'Will I be charged if I cancel my booking?';
      case HelpCategories.hotel:
        return 'Will I be charged if I cancel my booking?';
      case HelpCategories.flight:
        return 'Will I be charged if I cancel my booking?';
      case HelpCategories.combo:
        return 'Will I be charged if I cancel my booking?';
      case HelpCategories.tour:
        return 'Will I be charged if I cancel my booking?';
    }
  }

  String get detailsQuestion5 {
    switch (this) {
      case HelpCategories.general:
        return 'How soon will I get my money back?';
      case HelpCategories.hotel:
        return 'How soon will I get my money back?';
      case HelpCategories.flight:
        return 'How soon will I get my money back?';
      case HelpCategories.combo:
        return 'How soon will I get my money back?';
      case HelpCategories.tour:
        return 'How soon will I get my money back?';
    }
  }

  String get detailsQuestion6 {
    switch (this) {
      case HelpCategories.general:
        return 'Where can I check my flight booking details?';
      case HelpCategories.hotel:
        return 'Where can I check my flight booking details?';
      case HelpCategories.flight:
        return 'Where can I check my flight booking details?';
      case HelpCategories.combo:
        return 'Where can I check my flight booking details?';
      case HelpCategories.tour:
        return 'Where can I check my flight booking details?';
    }
  }

  String get detailsQuestion7 {
    switch (this) {
      case HelpCategories.general:
        return 'How do I check in for my flight at the airport? How to check in online?';
      case HelpCategories.hotel:
        return 'How do I check in for my flight at the airport? How to check in online?';
      case HelpCategories.flight:
        return 'How do I check in for my flight at the airport? How to check in online?';
      case HelpCategories.combo:
        return 'How do I check in for my flight at the airport? How to check in online?';
      case HelpCategories.tour:
        return 'How do I check in for my flight at the airport? How to check in online?';
    }
  }

  String get detailsQuestion8 {
    switch (this) {
      case HelpCategories.general:
        return 'How to check in online?';
      case HelpCategories.hotel:
        return 'How to check in online?';
      case HelpCategories.flight:
        return 'How to check in online?';
      case HelpCategories.combo:
        return 'How to check in online?';
      case HelpCategories.tour:
        return 'How to check in online?';
    }
  }

  String get detailsQuestion9 {
    switch (this) {
      case HelpCategories.general:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.hotel:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.flight:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.combo:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.tour:
        return 'What documents do I need to present at the airport check-in counter?';
    }
  }

  String get detailsQuestion10 {
    switch (this) {
      case HelpCategories.general:
        return 'What happens if an airline changes its flight schedule?';
      case HelpCategories.hotel:
        return 'What happens if an airline changes its flight schedule?';
      case HelpCategories.flight:
        return 'What happens if an airline changes its flight schedule?';
      case HelpCategories.combo:
        return 'What happens if an airline changes its flight schedule?';
      case HelpCategories.tour:
        return 'What happens if an airline changes its flight schedule?';
    }
  }

  String get detailsQuestion11 {
    switch (this) {
      case HelpCategories.general:
        return 'How do I check in for my flight at the airport?';
      case HelpCategories.hotel:
        return 'How do I check in for my flight at the airport?';
      case HelpCategories.flight:
        return 'How do I check in for my flight at the airport?';
      case HelpCategories.combo:
        return 'How do I check in for my flight at the airport?';
      case HelpCategories.tour:
        return 'How do I check in for my flight at the airport?';
    }
  }

  String get detailsQuestion12 {
    switch (this) {
      case HelpCategories.general:
        return 'How to check in online?';
      case HelpCategories.hotel:
        return 'How to check in online?';
      case HelpCategories.flight:
        return 'How to check in online?';
      case HelpCategories.combo:
        return 'How to check in online?';
      case HelpCategories.tour:
        return 'How to check in online?';
    }
  }

  String get detailsQuestion13 {
    switch (this) {
      case HelpCategories.general:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.hotel:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.flight:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.combo:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.tour:
        return 'What documents do I need to present at the airport check-in counter?';
    }
  }

  String get detailsQuestion14 {
    switch (this) {
      case HelpCategories.general:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.hotel:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.flight:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.combo:
        return 'What documents do I need to present at the airport check-in counter?';
      case HelpCategories.tour:
        return 'What documents do I need to present at the airport check-in counter?';
    }
  }

  String get detailsQuestion15 {
    switch (this) {
      case HelpCategories.general:
        return 'How to check in online?';
      case HelpCategories.hotel:
        return 'How to check in online?';
      case HelpCategories.flight:
        return 'How to check in online?';
      case HelpCategories.combo:
        return 'How to check in online?';
      case HelpCategories.tour:
        return 'How to check in online?';
    }
  }

  String get detailsQuestion16 {
    switch (this) {
      case HelpCategories.general:
        return 'How do I check in for my flight at the airport?';
      case HelpCategories.hotel:
        return 'How do I check in for my flight at the airport?';
      case HelpCategories.flight:
        return 'How do I check in for my flight at the airport?';
      case HelpCategories.combo:
        return 'How do I check in for my flight at the airport?';
      case HelpCategories.tour:
        return 'How do I check in for my flight at the airport?';
    }
  }

  String get detailsQuestion17 {
    switch (this) {
      case HelpCategories.general:
        return 'How to check in online?';
      case HelpCategories.hotel:
        return 'How to check in online?';
      case HelpCategories.flight:
        return 'How to check in online?';
      case HelpCategories.combo:
        return 'How to check in online?';
      case HelpCategories.tour:
        return 'How to check in online?';
    }
  }

  String get detailsAnswer1 {
    switch (this) {
      case HelpCategories.general:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
      case HelpCategories.hotel:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
      case HelpCategories.flight:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
      case HelpCategories.combo:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
      case HelpCategories.tour:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
    }
  }
}

extension FeaturedTopicsExtension on FeaturedTopics {
  String get question {
    switch (this) {
      case FeaturedTopics.topic1:
        return 'How can I cancel my flight ticket?';
      case FeaturedTopics.topic2:
        return 'I want to change my booking date. How can I do that?';
      case FeaturedTopics.topic3:
        return 'Where can I check my flight booking details?';
      case FeaturedTopics.topic4:
        return 'Heyo, can you resend my flight confirmation?';
      case FeaturedTopics.topic5:
        return 'How do I know if Heyo has received my booking payment?';
    }
  }

  String get answer {
    switch (this) {
      case FeaturedTopics.topic1:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
      case FeaturedTopics.topic2:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
      case FeaturedTopics.topic3:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
      case FeaturedTopics.topic4:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
      case FeaturedTopics.topic5:
        return 'Heyo now offers self-service options. By simply clicking on the self-service link provided in the confirmation email, you will be able to resend your booking confirmation to any of your preferred email addresses. Please note that you can also use this confirmation email as proof of your e-ticket for airport ';
    }
  }
}
