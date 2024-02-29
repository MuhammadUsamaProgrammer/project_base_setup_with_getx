import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServerError implements Exception {
  int _errorCode = 0;
  String _errorMessage = "";
  DioException _error = DioException(requestOptions: RequestOptions(path: ""));
  ServerError.withError({required DioException error}) {
    _error = error;
    _handleError(error);
  }

  getResponseCode() {
    return _error.response!.statusCode;
  }

  getErrorCode() {
    debugPrint(_errorCode.toString());
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(error) {
    if (error.type == DioExceptionType.unknown) {
      _errorCode = 0;
    } else {
      _errorCode = error.response.statusCode ?? 0;
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        _errorMessage = "Request was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout".tr;
        break;

      case DioExceptionType.badResponse:
        _errorMessage = "Something went wrong".tr;
        break;
      case DioExceptionType.unknown:
        _errorMessage = "Connection failed due to internet connection".tr;

        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Receive timeout in connection".tr;
        break;
      case DioExceptionType.sendTimeout:
        _errorMessage = "Receive timeout in send request".tr;
        break;
    }
    return _errorMessage;
  }
}
