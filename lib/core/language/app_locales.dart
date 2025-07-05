import 'dart:ui';

enum AppLocales {
  tr(Locale('tr')),
  en(Locale('en'));

  final Locale locale;

  const AppLocales(this.locale);

  static final List<Locale> supportedLocales = values.map((e) => e.locale).toList();
}
