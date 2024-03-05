import 'dart:convert';

import 'package:adhd/Models/sub_user.dart';

import '../Models/routin.dart';
import 'Utilites/api_connection.dart';
import 'Utilites/urls.dart';

class RoutinController {
  static Future<List<RoutinModel>> get() async {

    try{
      if(URL.userID.isEmpty){
        var profile = await ApiConnection.get(URL.PROFILE_URL, null);
        URL.userID=profile['data']['id'];
        List<dynamic> roles = profile['data']['roles'];
        URL.userType =  roles.first.toString();
        print('type is ${URL.userType}');

      }

      var response = await ApiConnection.get(URL.GET_ROUTIN_URL, null);

      var success = RoutinResponse.fromJson(response).code ?? 0;
      var message = RoutinResponse.fromJson(response).message ?? "";
      var data = RoutinResponse.fromJson(response).data;

      if (success == 200 || success == 201) {
        return data ?? [];
      } else {
        print(message);

        return Future.error(message);
      }
    }
    catch(e){
     return Future.error(e);
    }
  }


  static Future<Map<String,dynamic>> submitAnswers(Map<String,dynamic> body) async {


   try{
     var response = await ApiConnection.post(URL.POST_ROUTIN_URL, jsonEncode(body));

     var success = RoutinResponse.fromJson(response).code ?? 0;
     var message = RoutinResponse.fromJson(response).message ?? "";
     var data = RoutinResponse.fromJson(response).data;

     if (success == 200 || success == 201) {
       return {'success':true,'message':message};
     } else {
       print(message);

       return {'success':false,'message':message};
     }
   }catch(e){
     return {'success':false,'message':e.toString()};
   }
  }
  static Future<Map<String,dynamic>> submitChildAnswers(Map<String,dynamic> body) async {


   try{
     var response = await ApiConnection.post(URL.POST_CHILD_ROUTIN_URL, jsonEncode(body));

     var success = RoutinResponse.fromJson(response).code ?? 0;
     var message = RoutinResponse.fromJson(response).message ?? "";

     if (success == 200 || success == 201) {
       return {'success':true,'message':message};
     } else {
       print(message);

       return {'success':false,'message':message};
     }
   }catch(e){
     return {'success':false,'message':e.toString()};
   }
  }


  static Future<Map<String,dynamic>> getSubUsersList() async {


    try{
      var response = await ApiConnection.get(URL.GET_SUB_URL,null);

      var success = SubUsersResponse.fromJson(response).statusCode ?? 0;
      var message = SubUsersResponse.fromJson(response).message ?? "";
      var subUsers = SubUsersResponse.fromJson(response).subUsers ?? [];

      if (success == 200 || success == 201) {
        return {'success':true,'message':message,'data':subUsers};
      } else {
        print(message);

        return {'success':false,'message':message,'data':[]};
      }
    }catch(e){
      return {'success':false,'message':e.toString(),'data':[]};
    }
  }
}
