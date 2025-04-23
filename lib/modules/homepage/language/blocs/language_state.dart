import 'package:heyyo_trip/modules/homepage/language/enum/language_enum.dart';

class LanguageState {
  final LanguageEnum selectedLanguage;

  LanguageState({required this.selectedLanguage});

  LanguageState copyWith({LanguageEnum? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
