import 'dart:convert';

import 'package:adhd/Controllers/profile_controller.dart';
import 'package:adhd/Models/forget_password.dart';
import 'package:adhd/Utilities/static_functions.dart';
import 'package:flutter/material.dart';

import '../Models/user.dart';
import 'Utilites/api_connection.dart';
import 'Utilites/urls.dart';

class AuthCoontroller {
  static Future<bool> login(String email, String password) async {
    var body = {"emailOrUsername": email, "password": password};

    var response = await ApiConnection.post(URL.LOGIN_URL, jsonEncode(body));

    var success = UserResponse.fromJson(response).code ?? 0;
    var message = UserResponse.fromJson(response).message ?? "";
    var meta = UserResponse.fromJson(response).meta;

    if (success == 200 || success == 201) {
      URL.USER_TOKEN = meta?.token ?? "";
      StaticFunctions.saveToken(meta?.token ?? "");
      await ProfileController.getProfile();
      return true;
    } else {
      print(message);

      return Future.error(message);
    }
  }

  static Future<String> forgetPasswordEmail(String email) async {
    var body = {"email": email};

    var response = await ApiConnection.post(
        URL.FORGET_PASSWORD_EMAIL_URL, jsonEncode(body));

    var success = ForgetResponse.fromJson(response).code ?? 0;
    var message = ForgetResponse.fromJson(response).message ?? "";
    var successMessage = ForgetResponse.fromJson(response).data?.message ?? "";

    if (success == 200 || success == 201) {
      return response['meta']['token'];
    } else {
      print(message);

      return Future.error(message);
    }
  }

 
  static Future<String> forgetPasswordPhone(String email) async {
    var body = {"email": email};

    var response = await ApiConnection.post(
        URL.FORGET_PASSWORD_EMAIL_URL, jsonEncode(body));

    var success = ForgetResponse.fromJson(response).code ?? 0;
    var message = ForgetResponse.fromJson(response).message ?? "";
    var successMessage = ForgetResponse.fromJson(response).data?.message ?? "";

    if (success == 200 || success == 201) {
      return response['meta']['token'];
    } else {
      print(message);

      return Future.error(message);
    }
  }


  static Future<String> resetPasswordEmail(String email,String password,String token) async {
    var body = {
      "newPassword": password,
      "confirmPassword": password,
      "email": email,
      "token": token
    };

    var response = await ApiConnection.post(
        URL.PASSWORD_RESET_EMAIL_URL, jsonEncode(body));

    var success = ForgetResponse.fromJson(response).code ?? 0;
    var message = ForgetResponse.fromJson(response).message ?? "";
    var successMessage = ForgetResponse.fromJson(response).data?.message ?? "";

    if (success == 200 || success == 201) {
      return successMessage;
    } else {
      print(message);

      return Future.error(message);
    }
  }



}

//sudo gem install cocoapods