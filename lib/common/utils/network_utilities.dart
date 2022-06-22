import 'package:dio/dio.dart';

extension DioRequestExtensions on Response {
  /// Returns true if the [Response] statusCode is in the success range
  ///
  /// Also returns true if the [statusCode] is 304, this is when data is returned from the request cache
  bool get success {
    final status = statusCode;
    if (status == null) {
      return false;
    }
    return (status >= 200 && status < 300) || status == 304;
  }

  bool get clientError {
    final status = statusCode;
    if (status == null) {
      return false;
    }
    return status >= 400 && status < 500;
  }

  bool get serverError {
    final status = statusCode;
    if (status == null) {
      return false;
    }
    return status >= 400 && status < 500;
  }
}
