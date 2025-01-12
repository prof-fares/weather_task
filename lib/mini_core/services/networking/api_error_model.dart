class ApiErrorModel implements Exception {
  String? message;
  int? code;
  String? FirbaseCode;

  ApiErrorModel({required this.message, this.code, this.FirbaseCode});
  ApiErrorModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    code = json["code"];
  }
}
