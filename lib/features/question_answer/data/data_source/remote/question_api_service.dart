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
      final data = response.data;

      if (data == null || data['sorular'] == null) {
        throw Exception('Invalid response format');
      }

      return (data['sorular'] as List)
          .map((e) => QuestionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handle(e));
    } catch (e) {
      throw Exception('Failed to parse questions: $e');
    }
  }

  Future<List<CategoryModel>> getCategories(String languageCode) async {
    try {
      final response = await _dio.get('/kategoriler', queryParameters: {'lang': languageCode});
      final data = response.data;

      if (data == null) {
        throw Exception('Invalid response format');
      }

      return (data as List).map((e) => CategoryModel.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.handle(e));
    } catch (e) {
      throw Exception('Failed to parse categories: $e');
    }
  }
}
