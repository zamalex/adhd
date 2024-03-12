import 'dart:convert';

import 'package:adhd/Models/daily_notes_questions_response.dart';
import 'package:adhd/Models/sub_user.dart';

import '../Models/routin.dart';
import 'Utilites/api_connection.dart';
import 'Utilites/urls.dart';

class NotificationController {
  static Future<Map<String, dynamic>> sendNotification(
      Map<String, dynamic> body) async {
    try {
      var response =
          await ApiConnection.post(URL.SEND_NOTIFICATION, jsonEncode(body));

      var success = RoutinResponse.fromJson(response).code ?? 0;
      var message = RoutinResponse.fromJson(response).message ?? "";
      //var data = RoutinResponse.fromJson(response).data;

      if (success == 200 || success == 201) {
        return {'success': true, 'message': message};
      } else {
        print(message);

        return {'success': false, 'message': message};
      }
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }
}
