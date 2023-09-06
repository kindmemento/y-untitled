import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:y_mobile/utils/api_constants.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.interceptors.add(LogInterceptor(responseBody: true)); // For debugging
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw ApiException.from(e);
    }
  }

  Future<Response> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } catch (e) {
      throw ApiException.from(e);
    }
  }
}

class ApiException implements Exception {
  final String? message;
  final int? statusCode;
  final dynamic data;

  ApiException({this.statusCode, this.message, this.data});

  factory ApiException.from(dynamic exception) {
    final logger = Logger();

    int? statusCode;
    String? message;
    dynamic data;

    if (exception is DioException && exception.response != null) {
      statusCode = exception.response!.statusCode;
      message = exception.response!.statusMessage;
      data = exception.response!.data;

      logger.e("API Error: $statusCode - $message");
      logger.d("Response Data: $data");
    } else {
      message = exception is String ? exception : "An error occured while making the request";
    }

    return ApiException(statusCode: statusCode, message: message, data: data);
  }

  @override
  String toString() => 'ApiException: $message';
}
