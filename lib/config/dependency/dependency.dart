import 'package:get_it/get_it.dart';
import 'package:question_clean_arch/features/question_answer/data/data_source/local/question_local_service.dart';
import 'package:question_clean_arch/features/question_answer/data/data_source/remote/question_api_service.dart';
import 'package:question_clean_arch/features/question_answer/data/repository/question_answer_repository_impl.dart';
import 'package:question_clean_arch/features/question_answer/data/use_case/use_cases.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => QuestionApiService());
  getIt.registerLazySingleton(() => QuestionAnswerRepositoryImpl(getIt<QuestionApiService>()));

  // Use Cases
  getIt.registerLazySingleton(() => GetQuestionsUseCase(getIt<QuestionAnswerRepositoryImpl>()));
  getIt.registerLazySingleton(() => GetCategoriesUseCase(getIt<QuestionAnswerRepositoryImpl>()));

  getIt.registerLazySingleton(() => QuestionLocalService());
  getIt.registerLazySingleton(() => GetQuestionsLocalUseCase(getIt<QuestionLocalService>()));
}
