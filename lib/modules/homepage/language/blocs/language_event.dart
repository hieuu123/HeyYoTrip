import 'package:heyyo_trip/modules/homepage/language/enum/language_enum.dart';

abstract class LanguageEvent {}

// Gọi tại startup để load locale đã lưu
class LoadSavedLocale extends LanguageEvent {}

// Gọi khi user chọn ngôn ngữ mới
class SelectLanguage extends LanguageEvent {
  final LanguageEnum selectedLanguage;
  SelectLanguage(this.selectedLanguage);
}
