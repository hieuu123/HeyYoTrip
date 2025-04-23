import 'package:heyyo_trip/modules/homepage/language/enum/language_enum.dart';

abstract class LanguageEvent {}

class SelectLanguage extends LanguageEvent {
  final LanguageEnum selectedLanguage;

  SelectLanguage(this.selectedLanguage);
}
