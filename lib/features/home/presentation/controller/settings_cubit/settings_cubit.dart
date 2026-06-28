import 'package:e_wallet/features/home/presentation/controller/settings_cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit()
    : super(
        const SettingsState(themeMode: ThemeMode.light, locale: Locale('en')),
      );

  void toggleTheme() {
    emit(
      state.copyWith(
        themeMode: state.themeMode == ThemeMode.light
            ? ThemeMode.dark
            : ThemeMode.light,
      ),
    );
  }

  

  void changeLanguage(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState(
      themeMode: json['theme'] == 0 ? ThemeMode.light : ThemeMode.dark,
      locale: Locale(json['locale'] as String),
    );
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return {
      'theme': state.themeMode == ThemeMode.light ? 0 : 1,
      'locale': state.locale.languageCode,
    };
  }
}
