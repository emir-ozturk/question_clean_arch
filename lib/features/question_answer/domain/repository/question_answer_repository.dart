import 'package:question_clean_arch/features/question_answer/domain/entities/entities.dart';

abstract class QuestionAnswerRepository {
  Future<List<CategoryEntity>> getCategories(String languageCode);
  Future<List<QuestionEntity>> getQuestions(int categoryId);
}
