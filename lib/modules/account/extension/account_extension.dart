import 'package:flutter/material.dart';
import 'package:heyyo_trip/modules/account/enum/account_enum.dart';

extension AccountOptionExtension on AccountOption {
  String get icon {
    switch (this) {
      case AccountOption.profile:
        return 'assets/icons/profile-account.svg';
      case AccountOption.points:
        return 'assets/icons/points-account.svg';
      case AccountOption.promotionCode:
        return 'assets/icons/code-account.svg';
      case AccountOption.language:
        return 'assets/icons/language-account.svg';
      case AccountOption.currency:
        return 'assets/icons/currency-account.svg';
      case AccountOption.contactUs:
        return 'assets/icons/contact-account.svg';
      case AccountOption.helpCenter:
        return 'assets/icons/help-account.svg';
      case AccountOption.privacyPolicy:
        return 'assets/icons/privacy-account.svg';
      case AccountOption.terms:
        return 'assets/icons/term-account.svg';
      case AccountOption.about:
        return 'assets/icons/about-account.svg';
      case AccountOption.settings:
        return 'assets/icons/setting-account.svg';
      case AccountOption.logout:
        return 'assets/icons/logout-account.svg';
    }
  }

  String get title {
    switch (this) {
      case AccountOption.profile:
        return 'Profile';
      case AccountOption.points:
        return 'My points';
      case AccountOption.promotionCode:
        return 'My promotion code';
      case AccountOption.language:
        return 'Language';
      case AccountOption.currency:
        return 'Currency';
      case AccountOption.contactUs:
        return 'Contact us';
      case AccountOption.helpCenter:
        return 'Help Center';
      case AccountOption.privacyPolicy:
        return 'Privacy policy';
      case AccountOption.terms:
        return 'Term and conditions';
      case AccountOption.about:
        return 'About us';
      case AccountOption.settings:
        return 'Setting';
      case AccountOption.logout:
        return 'Log out';
    }
  }

  Color get color {
    return this == AccountOption.logout 
        ? const Color(0xFFDC3545)
        : const Color(0xFF666666);
  }

  bool get needsDivider {
    return this == AccountOption.currency || this == AccountOption.helpCenter;
  }
}