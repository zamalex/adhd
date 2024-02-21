import 'package:equatable/equatable.dart';

import '../Controllers/Utilites/urls.dart';
class UserResponse {
  int? code;
  String? message;
  UserModel? data;
  Meta? meta;

  UserResponse({
    this.message,
    this.code,
    this.data,
    this.meta,
  });

  factory UserResponse.fromJson(Map<String, dynamic>? json) => UserResponse(
        code: json?["statusCode"] ?? 400,
        message: json?["message"] ?? URL.SERVER_ERROR,
        data: UserModel.fromJson(json?['data']),
        meta: Meta.fromJson(json?['meta']),
      );
}

class Meta {
  String? token;
  Meta({
    this.token,
  });
  factory Meta.fromJson(Map<String, dynamic>? json) =>
      Meta(token: json?["token"] ?? "");
}

class UserModel extends Equatable {
  String? email;
  String? password;

  UserModel({this.email, this.password});

   factory UserModel.fromJson(Map<String, dynamic>? json) => UserModel(
        email: json?["email"] ?? "",
        // data: UserModel.fromJson(json?['data']),
        // meta: Meta.fromJson(json?['meta']),
      );

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
