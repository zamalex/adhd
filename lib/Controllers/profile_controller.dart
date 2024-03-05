import 'dart:convert';

import '../Models/user.dart';
import '../Utilities/static_functions.dart';
import 'Utilites/api_connection.dart';
import 'Utilites/urls.dart';

class ProfileController {
   static Future<bool> getProfile() async {

        var response = await ApiConnection.get(URL.PROFILE_URL, null);

    var success = UserResponse.fromJson(response).code ?? 0;
    var message = UserResponse.fromJson(response).message ?? "";
    var meta = UserResponse.fromJson(response).meta;

    if (success == 200 || success == 201) {
      // URL.USER_TOKEN = meta?.token ?? "";
      
      // StaticFunctions.saveToken(meta?.token ?? "");
      return true;
    } else {
      print(message);

      return Future.error(message);
    }
  }

} 