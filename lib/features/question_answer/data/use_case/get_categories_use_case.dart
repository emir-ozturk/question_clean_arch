import 'package:question_clean_arch/features/question_answer/data/models/category_model.dart';
import 'package:question_clean_arch/features/question_answer/domain/repository/question_answer_repository.dart';

/// Remote Use Case to get categories for a specific language.
final class GetCategoriesUseCase {
  final QuestionAnswerRepository _repository;

  GetCategoriesUseCase(this._repository);

  Future<List<CategoryModel>> call(String languageCode) async {
    return await _repository.getCategories(languageCode);
  }
}
