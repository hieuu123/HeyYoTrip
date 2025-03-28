import 'package:heyyo_trip/modules/homepage/help_center/enum/help_center_enum.dart';

extension Answer on HelpCategories {
  String getAnswerByIndex(int index) {
    switch (index) {
      case 1:
        return detailsAnswer1;
      default:
        return '';
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
