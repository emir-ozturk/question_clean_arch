import 'package:question_clean_arch/features/question_answer/data/models/models.dart';

abstract class QuestionAnswerRepository {
  Future<List<CategoryModel>> getCategories(String languageCode);
  Future<List<QuestionModel>> getQuestions(int categoryId);
}
