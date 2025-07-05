import 'package:question_clean_arch/features/question_answer/domain/entities/question_entity.dart';
import 'package:question_clean_arch/features/question_answer/domain/repository/question_answer_repository.dart';

class GetQuestionsUseCase {
  final QuestionAnswerRepository _repository;

  GetQuestionsUseCase(this._repository);

  Future<List<QuestionEntity>> call(int categoryId) async {
    return await _repository.getQuestions(categoryId);
  }
}
