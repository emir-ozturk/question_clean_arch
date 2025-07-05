import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question_clean_arch/config/dependency/dependency.dart';
import 'package:question_clean_arch/core/language/app_localization.dart';
import 'package:question_clean_arch/features/question_answer/presentation/provider/question_provider.dart';
import 'package:question_clean_arch/features/question_answer/presentation/view/category_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupDependencies();
  runApp(AppLocalization(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionProvider(getIt(), getIt(), getIt())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
        home: const CategoryView(),
      ),
    );
  }
}
