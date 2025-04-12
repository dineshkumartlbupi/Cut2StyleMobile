import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static BuildContext? _context;

  static void setContext(BuildContext context) {
    _context = context;
  }

  static Future<void> handleDioError(DioException error) async {
    String title = "Error";
    String message = "Something went wrong.";

    if (error.response != null && error.response?.data is Map) {
      final data = error.response?.data;

      if (data != null && data['errors'] != null) {
        final errors = data['errors'] as Map<String, dynamic>;
        message = errors.values.expand((e) => e).join('\n');
        title = "Validation Error";
      } else if (data['message'] != null) {
        message = data['message'];
      }
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      message = "Connection timed out. Please try again.";
    } else if (error.type == DioExceptionType.badCertificate) {
      message = "SSL Certificate Error.";
    } else if (error.message != null) {
      message = error.message!;
    }

    if (_context != null) {
      showDialog(
        context: _context!,
        builder: (_) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(_context!).pop(),
              child: const Text('OK'),
            )
          ],
        ),
      );
    }
  }

  static void showError(String message) {
    Get.snackbar("Error", message, snackPosition: SnackPosition.BOTTOM);
  }
}
