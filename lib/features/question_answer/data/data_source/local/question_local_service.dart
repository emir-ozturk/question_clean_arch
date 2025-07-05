import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:question_clean_arch/features/question_answer/data/models/models.dart';

class QuestionLocalService {
  Future<List<QuestionModel>> getQuestions(String languageCode) async {
    try {
      final data = await rootBundle.loadString('assets/data/questions/question_$languageCode.json');
      final List questionsJson = json.decode(data);
      return questionsJson.map((question) => QuestionModel.fromJson(question)).toList();
    } catch (error) {
      throw Exception('Failed to load questions: $error');
    }
  }

  Future<List<CategoryModel>> getCategories(String languageCode) async {
    try {
      final data = await rootBundle.loadString(
        'assets/data/categories/category_$languageCode.json',
      );
      final List categoriesJson = json.decode(data);
      return categoriesJson.map((category) => CategoryModel.fromJson(category)).toList();
    } catch (error) {
      throw Exception('Failed to load categories: $error');
    }
  }
}
