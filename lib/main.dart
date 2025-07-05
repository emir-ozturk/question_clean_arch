import 'package:flutter/material.dart';
import 'package:question_clean_arch/core/language/app_localization.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLocalization(
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold()),
    );
  }
}
