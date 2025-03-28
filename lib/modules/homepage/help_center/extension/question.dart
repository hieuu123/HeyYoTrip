import 'package:heyyo_trip/modules/homepage/help_center/enum/help_center_enum.dart';

extension Question on HelpCategories {
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
}
