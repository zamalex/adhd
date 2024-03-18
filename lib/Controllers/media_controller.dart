import 'dart:convert';

import 'package:adhd/Models/notifications_response.dart';
import 'package:flutter/material.dart';

import '../Models/media_response.dart';
import '../Models/reports_response.dart';
import '../Models/user.dart';
import 'Utilites/api_connection.dart';
import 'Utilites/urls.dart';

class MediaController {
  static Future<List<Video>> getVideosList() async {

    try{
      var response = await ApiConnection.get(URL.VIDEO_URL,{});

      var videos = MediaResponse.fromJson(response).videos ?? [];
      var success = MediaResponse.fromJson(response).statusCode ?? 0;

      if (success == 200 || success == 201) {

        return videos;
      } else {

        return [];
      }
    }
    catch(e){
      return [];
    }

  }

  static Future<List<Video>> getAudioList() async {

    try{
      var response = await ApiConnection.get(URL.AUDIO_URL,{});

      var videos = MediaResponse.fromJson(response).videos ?? [];
      var success = MediaResponse.fromJson(response).statusCode ?? 0;

      if (success == 200 || success == 201) {

        return videos;
      } else {

        return [];
      }
    }
    catch(e){
      return [];
    }

  }


  static Future<List<Video>> getFilesList() async {

    try{
      var response = await ApiConnection.get(URL.FILES_URL,{});

      var videos = MediaResponse.fromJson(response).videos ?? [];
      var success = MediaResponse.fromJson(response).statusCode ?? 0;

      if (success == 200 || success == 201) {

        return videos;
      } else {

        return [];
      }
    }
    catch(e){
      return [];
    }

  }




  static Future<List<Report>> getReportsList(Map<String,String> query) async {

    try{
      var response = await ApiConnection.get(URL.REPORTS_URL,query);

      List<Report> reports =[];

      (response as List).forEach((element) {
        Report r = Report.fromJson(element);
        reports.add(r);
        print(reports.length);
        print(r.fileDownloadName);
      });

      print(reports.length);

        return reports;

    }
    catch(e){
      return [];
    }

  }


  static Future<List<Video>> getBehavioralProblemsFiles() async {

    try{
      var response = await ApiConnection.get(URL.BEHAVIORAL_PROBLEMS_FILES_URL,{});

      var videos = MediaResponse.fromJson(response).videos ?? [];
      var success = MediaResponse.fromJson(response).statusCode ?? 0;

      if (success == 200 || success == 201) {

        return videos;
      } else {

        return [];
      }
    }
    catch(e){
      return [];
    }

  }

  static Future<List<NotificationItem>> getNotificationsList() async {

    try{
      var response = await ApiConnection.get('${URL.NOTIFICATIONS_URL}/${URL.userID}',{});

      var videos = NotificationResponse.fromJson(response).notifications ?? [];
      var success = NotificationResponse.fromJson(response).statusCode ?? 0;

      if (success == 200 || success == 201) {

        return videos;
      } else {

        return [];
      }
    }
    catch(e){
      return [];
    }

  }



  static Future<List<NotificationItem>> getStaticNotificationsList() async {

    try{
      var response = await ApiConnection.get('${URL.STATIC_NOTIFICATIONS_URL}',{});

      var videos = NotificationResponse.fromJson(response).notifications ?? [];
      var success = NotificationResponse.fromJson(response).statusCode ?? 0;

      if (success == 200 || success == 201) {

        return videos;
      } else {

        return [];
      }
    }
    catch(e){
      return [];
    }

  }


}
