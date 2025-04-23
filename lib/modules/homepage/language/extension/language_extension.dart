import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heyyo_trip/modules/homepage/language/enum/language_enum.dart';

extension LanguageExtension on LanguageEnum {
  /// Mã ngôn ngữ để setLocale
  String get code {
    switch (this) {
      case LanguageEnum.vietnamese:
        return 'vi';
      case LanguageEnum.english:
      default:
        return 'en';
    }
  }

  /// Locale object phục vụ easy_localization
  Locale get locale => Locale(code);

  /// Key trong file JSON để gọi .tr()
  String get titleKey {
    switch (this) {
      case LanguageEnum.vietnamese:
        return 'language.vietnamese';
      case LanguageEnum.english:
      default:
        return 'language.english';
    }
  }

  /// Lấy luôn chuỗi đã dịch
  String get title => titleKey.tr();

  /// Đường dẫn asset của flag
  String get logo {
    switch (this) {
      case LanguageEnum.vietnamese:
        return 'assets/images/vietnam-flag.png';
      case LanguageEnum.english:
      default:
        return 'assets/images/usa-flag.png';
    }
  }
}
