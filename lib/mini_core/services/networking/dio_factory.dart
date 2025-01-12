import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_task/mini_core/services/networking/api_constants.dart';
import 'package:weather_task/mini_core/services/networking/onRequest_interceptor.dart';


class DioClient {
  late Dio dio;

  DioClient() {
    BaseOptions options = BaseOptions(
        sendTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
   );
   
    dio = Dio(options);
  //  dio.interceptors.add(OnRequestInterceptor(dio));
    dio.interceptors.add(
      PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
      maxWidth: 100,
    )
    );
//     dio.interceptors.add(RetryInterceptor(
//   dio: dio,
//   logPrint: print, 
//   retries: 3, 
//   retryDelays: const [ // set delays between retries (optional)
//     Duration(seconds: 1), // wait 1 sec before first retry
//     Duration(seconds: 2), // wait 2 sec before second retry
//     Duration(seconds: 3), 
//   ],
// ));
  }
  Future<Response> getData(String url,
      {Map<String, dynamic>? data = const {}, Options? options}) async {
    options ??= Options(extra: {'requiresToken': true});

    final response =
        await dio.get(url, queryParameters: data, options: options);
    return response;
  }

  Future<Response> postData(String url,
      {Map<String, dynamic>? data = const {}, Options? options ,bool query =true}) async {
    options ??= Options(extra: {'requiresToken': true});

    final response =
        await dio.post(url,
        queryParameters: query? data:null,
         data
        : query?null: data, options: options);
    return response;
  }

  Future<Response> removeData(String url,
      {Map<String, dynamic>? data = const {}, Options? options}) async {
    options ??= Options(extra: {'requiresToken': true});
    final response =
        await dio.delete(url, queryParameters: data, options: options);
    return response;
  }

  Future<Response> postDataFormData(String url,
      {FormData? data, Options? options}) async {
    options ??= Options(extra: {'requiresToken': true});

    return await dio.post(url, data: data, options: options);
  }

  Future<Response> patchData(String url,
      {Map<String, dynamic>? data = const {}, Options? options}) async {
    options ??= Options(extra: {'requiresToken': true});
    final response =
        await dio.patch(url, queryParameters: data, options: options);
    return response;
  }
}
