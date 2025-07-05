import 'package:flutter/material.dart';
import 'package:question_clean_arch/features/question_answer/data/use_case/use_cases.dart';
import 'package:question_clean_arch/features/question_answer/domain/entities/entities.dart';

class QuestionProvider with ChangeNotifier {
  // Use cases
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetQuestionsUseCase _getQuestionsUseCase;
  final GetQuestionsLocalUseCase _getQuestionsLocalUseCase;

  // State
  bool isLoading = false;
  List<CategoryEntity> categories = [];
  List<QuestionEntity> questions = [];
  String? errorMessage;

  // Utils
  void _toggleLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  QuestionProvider(
    this._getCategoriesUseCase,
    this._getQuestionsUseCase,
    this._getQuestionsLocalUseCase,
  );

  Future<void> getCategories(String languageCode) async {
    _toggleLoading();

    try {
      categories = await _getCategoriesUseCase(languageCode);
    } catch (e) {
      // Eğer bir hata oluşursa, yerel dosyadan soruları çek.
      questions = await _getQuestionsLocalUseCase(languageCode);
      errorMessage = e.toString();
    } finally {
      _toggleLoading();
    }
  }

  Future<void> getQuestions(int categoryId) async {
    _toggleLoading();

    try {
      questions = await _getQuestionsUseCase(categoryId);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      _toggleLoading();
    }
  }
}
