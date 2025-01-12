import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_task/mini_core/error/failures.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  // API_LOGIC_ERROR,
  DEFAULT
}

class ApiErrors {
static const String badRequestError =
  "طلب غير صالح";

static const String noContent =
  "لا توجد محتويات";
  static const String forbiddenError = "لا تملك صلاحيات الوصول";

  static const String unauthorizedError = "لم يتم التحقق من هويتك";

  static const String notFoundError = "المورد غير موجود";

  static const String conflictError = "تعارض في البيانات";

  static const String internalServerError = "خطأ داخلي في الخادم";

  static const String unknownError = "حدث خطأ غير معروف";

  static String timeoutError = "انتهت مهلة الاتصال";

  static String defaultError = "حدث خطأ غير متوقع، يرجى المحاولة لاحقاً";

  static String cacheError = "حدث خطأ أثناء تحميل البيانات من الذاكرة المؤقتة";

  static String noInternetError = "لا يوجد اتصال بالإنترنت";

  static String loadingMessage = "جاري التحميل...";

  static String retryAgainMessage = "الرجاء المحاولة مرة أخرى";

  static String ok = "موافق";
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // ServerFailure, API rejected request
  static const int UNAUTORISED = 401; // ServerFailure, user is not authorised
  static const int FORBIDDEN = 403; //  ServerFailure, API rejected request
  static const int INTERNAL_SERVER_ERROR =
      500; // ServerFailure, crash in server side
  static const int NOT_FOUND = 404; // ServerFailure, not found
  static const int API_LOGIC_ERROR = 422; // API , lOGIC ERROR

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT =
      ApiErrors.noContent; // success with no data (no content)
  static const String BAD_REQUEST =
      ApiErrors.badRequestError; // ServerFailure, API rejected request
  static const String UNAUTORISED =
      ApiErrors.unauthorizedError; // ServerFailure, user is not authorised
  static const String FORBIDDEN =
      ApiErrors.forbiddenError; //  ServerFailure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      ApiErrors.internalServerError; // ServerFailure, crash in server side
  static const String NOT_FOUND =
      ApiErrors.notFoundError; // ServerFailure, crash in server side

  // local status code
  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECIEVE_TIMEOUT = ApiErrors.timeoutError;
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ServerFailure getServerFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ServerFailure(
            statusCode: ResponseCode.NO_CONTENT,
            statusMessage: ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return ServerFailure(
            statusCode: ResponseCode.BAD_REQUEST,
            statusMessage: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return ServerFailure(
            statusCode: ResponseCode.FORBIDDEN,
            statusMessage: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return ServerFailure(
            statusCode: ResponseCode.UNAUTORISED,
            statusMessage: ResponseMessage.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return ServerFailure(
            statusCode: ResponseCode.NOT_FOUND,
            statusMessage: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ServerFailure(
            statusCode: ResponseCode.INTERNAL_SERVER_ERROR,
            statusMessage: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return ServerFailure(
            statusCode: ResponseCode.CONNECT_TIMEOUT,
            statusMessage: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return ServerFailure(
            statusCode: ResponseCode.CANCEL,
            statusMessage: ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return ServerFailure(
            statusCode: ResponseCode.RECIEVE_TIMEOUT,
            statusMessage: ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return ServerFailure(
            statusCode: ResponseCode.SEND_TIMEOUT,
            statusMessage: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return ServerFailure(
            statusCode: ResponseCode.CACHE_ERROR,
            statusMessage: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return ServerFailure(
            statusCode: ResponseCode.NO_INTERNET_CONNECTION,
            statusMessage: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return ServerFailure(
            statusCode: ResponseCode.DEFAULT,
            statusMessage: ResponseMessage.DEFAULT);
    }
  }
}

class ErrorHandler implements Exception {
  late ServerFailure serverFailure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      serverFailure = _handleError(error);
    } else {
      // default error
      serverFailure = DataSource.DEFAULT.getServerFailure();
    }
  }
}

ServerFailure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getServerFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getServerFailure();

    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getServerFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null &&
          error.response!.data is Map<String, dynamic>) {
        return ServerFailure.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getServerFailure();
      }

    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null &&
          error.response!.data is Map<String, dynamic>) {
        return ServerFailure.fromJson(error.response!.data);
      } else {
        return DataSource.DEFAULT.getServerFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getServerFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getServerFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getServerFailure();
  }
}
