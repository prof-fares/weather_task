// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import '../local_services/token_manger.dart';
// import '../localizationService/localization_service.dart';

// class OnRequestInterceptor extends Interceptor {


//   Dio dio;

//   OnRequestInterceptor(this.dio);

//   @override
//   Future<void> onRequest(
    
//       RequestOptions options, RequestInterceptorHandler handler) async {
        
      
//             String languageCode = await Get.find<LocalizationService>().getSavedLocale()??"ar";

//         options.headers["lang"] = languageCode;

//     bool requiresToken = options.extra['requiresToken'] ?? true;

//     if (requiresToken) {
//       String? accessToken =  TokenManager.getToken();
     
//       if (accessToken != null && accessToken.isNotEmpty) {
//         options.headers['Authorization'] = 'Bearer $accessToken';
//       }
//     }
//     super.onRequest(options, handler);
//   }


//    }
