import 'package:question_clean_arch/features/question_answer/data/data_source/local/question_local_service.dart';
import 'package:question_clean_arch/features/question_answer/domain/entities/question_entity.dart';
import 'package:question_clean_arch/features/question_answer/domain/repository/question_answer_repository.dart';

/// Remote Use Case to get questions for a specific category.
final class GetQuestionsUseCase {
  final QuestionAnswerRepository _repository;

  GetQuestionsUseCase(this._repository);

  Future<List<QuestionEntity>> call(int categoryId) async {
    return await _repository.getQuestions(categoryId);
  }
}

/// Local Use Case to get questions for a specific language.
final class GetQuestionsLocalUseCase {
  final QuestionLocalService _service;

  GetQuestionsLocalUseCase(this._service);

  Future<List<QuestionEntity>> call(String languageCode) async {
    return await _service.getQuestions(languageCode);
  }
}
