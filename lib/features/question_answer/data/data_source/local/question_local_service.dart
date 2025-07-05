import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:question_clean_arch/features/question_answer/data/models/models.dart';

final class QuestionLocalService {
  Future<List<QuestionModel>> getQuestions(String languageCode) async {
    try {
      final data = await rootBundle.loadString('assets/data/questions/question_$languageCode.json');
      final List questionsJson = json.decode(data);
      return questionsJson.map((question) => QuestionModel.fromJson(question)).toList();
    } catch (error) {
      throw Exception('Failed to load questions: $error');
    }
  }
}
