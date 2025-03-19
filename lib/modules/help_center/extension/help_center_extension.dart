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
