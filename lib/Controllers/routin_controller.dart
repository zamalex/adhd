import 'dart:convert';

import 'package:adhd/Models/daily_notes_questions_response.dart';
import 'package:adhd/Models/sub_user.dart';

import '../Models/routin.dart';
import 'Utilites/api_connection.dart';
import 'Utilites/urls.dart';

class RoutinController {
  static Future<List<RoutinModel>> get({SubUser? subUser}) async {

    try{
      if(URL.userID.isEmpty){
        var profile = await ApiConnection.get(URL.PROFILE_URL, null);
        URL.userID=profile['data']['id'];
        List<dynamic> roles = profile['data']['roles'];
        URL.userType =  roles.first.toString();
        print('type is ${URL.userType}');

      }
      String tempId = URL.userID;

      if(URL.userType=='Parent'){
        subUser = URL.selectedChild;
      }
      if(subUser!=null){
        URL.userID = subUser.id!;
      }

      print('id is ${URL.userID}');

      var response = await ApiConnection.get(URL.GET_ROUTIN_URL, null);

      URL.userID  = tempId;
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


  static Future<Map<String,dynamic>> submitAnswers(Map<String,dynamic> body,SubUser? subUser) async {


   try{

     String tempId = URL.userID;
     if(subUser!=null){
       URL.userID = subUser.id!;
     }
     var response = await ApiConnection.post(URL.POST_ROUTIN_URL, jsonEncode(body));

     URL.userID  = tempId;

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



  static Future<Map<String,dynamic>> submiSubUserAnswers(Map<String,dynamic> body) async {


   try{
     var response = await ApiConnection.post('${URL.SUBMIT_SUB_USER_ANSWER_URL}/${URL.userType}', jsonEncode(body));

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


  static Future<Map<String,dynamic>> getDailyNotesQuestionsList() async {


    try{
      var response = await ApiConnection.get(URL.GET_DAILY_NOTES_QUESTIONS_URL,{
        "role": "Trainer"
        //,"ageGroup": "Teen"
      });

      var success = DailyNotesQuestionsResponse.fromJson(response).statusCode ?? 0;
      var message = DailyNotesQuestionsResponse.fromJson(response).message ?? "";
      var questions = DailyNotesQuestionsResponse.fromJson(response).data ?? [];

      if (success == 200 || success == 201) {
        return {'success':true,'message':message,'data':questions};
      } else {
        print(message);

        return {'success':false,'message':message,'data':[]};
      }
    }catch(e){
      return {'success':false,'message':e.toString(),'data':[]};
    }
  }
}
