import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_app/shared/cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocalState> {
  LocaleCubit() : super(ChangeLocalState(locale: const Locale('en')));

  Future<void> getSavedLanguage() async {
    final String languageCode = await CacheHelper().getCachedLanguage();
    emit(ChangeLocalState(locale: Locale(languageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await CacheHelper().changeCachedLanguage(languageCode);
    emit(ChangeLocalState(locale: Locale(languageCode)));
  }
}
