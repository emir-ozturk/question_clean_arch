import 'package:dio/dio.dart';
import 'package:question_clean_arch/core/error/dio_error_handler.dart';
import 'package:question_clean_arch/features/question_answer/data/models/models.dart';

class QuestionApiService {
  final Dio _dio;

  QuestionApiService([Dio? dio])
    : _dio = dio ?? Dio(BaseOptions(baseUrl: 'https://soru.sozlerkosku.com/api'));

  Future<List<QuestionModel>> getQuestions(int categoryId) async {
    try {
      final response = await _dio.get('/sorular/$categoryId');
      return (response.data['sorular'] as List).map((e) => QuestionModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handle(e));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<CategoryModel>> getCategories(String languageCode) async {
    try {
      final response = await _dio.get('/kategoriler', queryParameters: {'lang': languageCode});
      return response.data.map((e) => CategoryModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handle(e));
    } catch (e) {
      throw Exception(e);
    }
  }
}
