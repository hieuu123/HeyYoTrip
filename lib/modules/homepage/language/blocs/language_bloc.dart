import 'package:flutter_bloc/flutter_bloc.dart';
import 'language_event.dart';
import 'language_state.dart';
import 'package:heyyo_trip/modules/homepage/language/enum/language_enum.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      : super(LanguageState(selectedLanguage: LanguageEnum.english)) {
    on<SelectLanguage>((event, emit) {
      emit(state.copyWith(selectedLanguage: event.selectedLanguage));
    });
  }
}
