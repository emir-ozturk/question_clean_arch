import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:question_clean_arch/core/language/app_locales.dart';

final class AppLocalization extends EasyLocalization {
  AppLocalization({super.key, required super.child})
    : super(
        supportedLocales: AppLocales.supportedLocales,
        fallbackLocale: AppLocales.tr.locale,
        path: "assets/translations",
        useOnlyLangCode: true,
      );

  static Future<void> changeLocale(BuildContext context, AppLocales language) async =>
      await context.setLocale(language.locale);
}
