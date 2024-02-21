import '../Controllers/Utilites/urls.dart';

class ForgetResponse {
  int? code;
  String? message;
  ForgetModel? data;

  ForgetResponse({
    this.message,
    this.code,
    this.data,
  });

  factory ForgetResponse.fromJson(Map<String, dynamic>? json) => ForgetResponse(
        code: json?["statusCode"] ?? 400,
        message: json?["message"] ?? URL.SERVER_ERROR,
        data: ForgetModel.fromJson(json?['data']),
      );
}

class ForgetModel {
  String? message;
  ForgetModel({
    this.message,
  });

  factory ForgetModel.fromJson(Map<String, dynamic>? json) => ForgetModel(
        message: json?["message"] ?? URL.SERVER_ERROR,
      );
}