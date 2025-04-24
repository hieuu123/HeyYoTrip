import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:heyyo_trip/common/shared_prefs/shared_prefs_manager.dart';
import 'package:heyyo_trip/modules/homepage/language/extension/language_extension.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState(locale: const Locale('en'))) {
    // 1. Load locale đã lưu khi khởi
    on<LoadSavedLocale>(_onLoadSavedLocale);
    // 2. Chọn và lưu ngôn ngữ mới
    on<SelectLanguage>(_onSelectLanguage);
  }

  Future<void> _onLoadSavedLocale(
    LoadSavedLocale event,
    Emitter<LanguageState> emit,
  ) async {
    final code = await PreferencesManager.getLocale() ?? 'en';
    emit(state.copyWith(locale: Locale(code)));
  }

  Future<void> _onSelectLanguage(
    SelectLanguage event,
    Emitter<LanguageState> emit,
  ) async {
    final code = event.selectedLanguage.code; // từ extension
    await PreferencesManager.setLocale(code);
    emit(state.copyWith(locale: Locale(code)));
  }
}
