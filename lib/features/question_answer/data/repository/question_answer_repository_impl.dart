import 'package:question_clean_arch/features/question_answer/data/data_source/remote/question_api_service.dart';
import 'package:question_clean_arch/features/question_answer/data/models/models.dart';
import 'package:question_clean_arch/features/question_answer/domain/repository/question_answer_repository.dart';

class QuestionAnswerRepositoryImpl extends QuestionAnswerRepository {
  final QuestionApiService _questionApiService;

  QuestionAnswerRepositoryImpl(this._questionApiService);

  @override
  Future<List<QuestionModel>> getQuestions(int categoryId) async {
    return await _questionApiService.getQuestions(categoryId);
  }

  @override
  Future<List<CategoryModel>> getCategories(String languageCode) async {
    return await _questionApiService.getCategories(languageCode);
  }
}
