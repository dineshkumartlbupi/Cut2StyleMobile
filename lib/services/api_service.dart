import 'package:cut2style/core/constants/api_end_points.dart';
import 'package:cut2style/core/error/error_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  static final Dio dio = Dio(BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
    headers: {"Content-Type": "application/json"},
  ));

  static final _storage = FlutterSecureStorage();

  static Future<void> setup() async {
    final token = await _storage.read(key: 'auth_token');
    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  static Future<Response?> get(String endpoint) async {
    try {
      return await dio.get(endpoint);
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    } catch (e) {
      _handleGenericError(e);
      return null;
    }
  }

  static Future<Response?> post(String endpoint, dynamic data) async {
    try {
      final token = await _storage.read(key: 'auth_token'); // Fetch token
      return await dio.post(
        endpoint,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            if (token != null) "Authorization": "Bearer $token",
          },
        ),
      );
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    } catch (e) {
      _handleGenericError(e);
      return null;
    }
  }

  static Future<Response?> postWithBearerToken(
      String endpoint, dynamic data) async {
    try {
      return await dio.post(
        endpoint,
        data: data,
        options: Options(
          headers: {"Content-Type": "application/json"},
        ),
      );
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    } catch (e) {
      _handleGenericError(e);
      return null;
    }
  }

  static Future<Response?> put(String endpoint, dynamic data) async {
    try {
      return await dio.put(endpoint, data: data);
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    } catch (e) {
      _handleGenericError(e);
      return null;
    }
  }

  static Future<Response?> delete(String endpoint) async {
    try {
      return await dio.delete(endpoint);
    } on DioException catch (e) {
      _handleDioError(e);
      return null;
    } catch (e) {
      _handleGenericError(e);
      return null;
    }
  }

  static void _handleDioError(DioException e) {
    final statusCode = e.response?.statusCode;
    final responseData = e.response?.data;
    print("❌ Dio Error:");
    print("Status Code: ${e.response?.statusCode}");
    print("Message: ${e.message}");
    print("Response Data: ${e.response?.data}");
    String userMessage = "Something went wrong.";
    switch (statusCode) {
      case 400:
        userMessage = "Bad Request. Please try again.";
        break;
      case 401:
        userMessage = "Unauthorized. Please login again.";
        break;
      case 403:
        userMessage = "Access denied.";
        break;
      case 404:
        userMessage = "Resource not found.";
        break;
      case 422:
        final errors = responseData['errors'];
        if (errors is Map) {
          userMessage = errors.entries
              .map((e) => "${e.key}: ${e.value.join(', ')}")
              .join("\n");
        } else {
          userMessage = "Validation failed.";
        }
        break;
      case 500:
        userMessage = "Server error. Please try later.";
        break;
      default:
        userMessage = e.message ?? "Unexpected error.";
    }

    print("❌ Dio Error ($statusCode): $userMessage");
    ErrorHandler.showError(userMessage);
  }

  static void _handleGenericError(dynamic e) {
    print("❌ Generic Error: $e");
    ErrorHandler.showError("An unexpected error occurred.");
  }
}
