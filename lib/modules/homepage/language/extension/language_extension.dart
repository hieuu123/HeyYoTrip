import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:heyyo_trip/modules/homepage/language/enum/language_enum.dart';

extension LanguageExtension on LanguageEnum {
  /// Mã ngôn ngữ ISO (languageCode)
  String get code {
    switch (this) {
      case LanguageEnum.vietnamese:
        return 'vi';
      case LanguageEnum.english:
      default:
        return 'en';
    }
  }

  /// Locale ứng với enum
  Locale get locale => Locale(code);

  /// Tiêu đề đã dịch theo ngôn ngữ hiện tại
  String title(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case LanguageEnum.vietnamese:
        return l10n.languageVietnamese;
      case LanguageEnum.english:
      default:
        return l10n.languageEnglish;
    }
  }

  /// Đường dẫn tới flag asset
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

