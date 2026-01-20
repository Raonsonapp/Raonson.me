import 'app_exception.dart';

class ErrorHandler {
  static AppException handle(dynamic error) {
    if (error is AppException) return error;
    return AppException('Unknown error occurred');
  }
}