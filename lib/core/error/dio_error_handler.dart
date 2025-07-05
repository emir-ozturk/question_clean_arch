import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class DioErrorHandler {
  static String handle(DioException error) {
    log(error.toString());

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'error.connection_timeout'.tr();
      case DioExceptionType.sendTimeout:
        return 'error.send_timeout'.tr();
      case DioExceptionType.connectionError:
        return 'error.connection_error'.tr();
      case DioExceptionType.badResponse:
        return 'error.type.${error.response?.statusCode ?? "404"}'.tr();
      default:
        return 'error.server_error'.tr();
    }
  }
}
