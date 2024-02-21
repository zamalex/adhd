import 'dart:convert';
import 'dart:io';

import 'package:adhd/Controllers/Utilites/urls.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ApiConnection {
  static Future<dynamic> post(String url, Object? body) async {
    try {
      print("//////////////////");
      print(url);
      print(body);
      print(URL.HEADER());

      final response =
          await http.post(Uri.parse(url), headers: URL.HEADER(), body: body);

      print(response.body);
      print("///////////////");

      var reponse = json.decode(response.body);
      print(reponse);

      return reponse;
    } on SocketException catch (_) {
      return Future.error(URL.NO_INTERNET_CONNECTION);
    } catch (error) {
      print(error);
      return Future.error(URL.SERVER_ERROR);
    }
  }

  static Future<dynamic> get(String url, Map<String, dynamic>? body) async {
    try {
      print("//////////////////");
      var urlWithBody = Uri.parse(url);
      if (body != {}){
       urlWithBody = Uri.parse(url).replace(queryParameters: body);
      }
      print(urlWithBody);
      print(URL.HEADER());

      final response = await http.get(urlWithBody, headers: URL.HEADER());

      print(response.body);
      print("///////////////");

      var reponse = json.decode(response.body);
      print(reponse);

      return reponse;
    } on SocketException catch (_) {
      return Future.error(URL.NO_INTERNET_CONNECTION);
    } catch (error) {
      print(error);
      return Future.error(URL.SERVER_ERROR);
    }
  }

  static Future<dynamic> delete(String url, Map<String, dynamic>? body) async {
    try {
      print("//////////////////");
      var urlWithBody = Uri.parse(url).replace(queryParameters: body);

      print(urlWithBody);
      print(URL.HEADER());

      final response = await http.delete(urlWithBody, headers: URL.HEADER());

      print(response.body);
      print("///////////////");

      var reponse = json.decode(response.body);
      print(reponse);

      return reponse;
    } on SocketException catch (_) {
      return Future.error(URL.NO_INTERNET_CONNECTION);
    } catch (error) {
      print(error);
      return Future.error(URL.SERVER_ERROR);
    }
  }

  static Future<dynamic> put(String url, Map<String, dynamic>? body) async {
    try {
      print("//////////////////");
      var urlWithBody = Uri.parse(url);

      print(urlWithBody);
      print(URL.HEADER());

      final response =
          await http.put(urlWithBody, headers: URL.HEADERWithoutCharset(), body: body);

      print(response.body);
      print("///////////////");

      var reponse = json.decode(response.body);
      print(reponse);

      return reponse;
    } on SocketException catch (_) {
      return Future.error(URL.NO_INTERNET_CONNECTION);
    } catch (error) {
      print(error);
      return Future.error(URL.SERVER_ERROR);
    }
  }

  static Future<dynamic> upload(
      String url, Map<String, String>? body, File? image) async {
    try {
      print("//////////////////");
      var urlWithBody = Uri.parse(url);

      print(urlWithBody);
      print(URL.HEADER());
// var request = new http.MultipartRequest("POST", url);

      var request = http.MultipartRequest("PUT", urlWithBody);
      if (image != null) {
        request.files.add(new http.MultipartFile.fromBytes(
            'Image', await File.fromUri(image.uri).readAsBytes(),
            contentType: new MediaType('image', 'jpeg')));
      }
      request.fields.addAll(body ?? {});
      await request.send().then((response) async {
        response.stream.transform(utf8.decoder).listen((value) {
          print(value);

          var reponse = json.decode(value);
          print(reponse);

          return reponse;
        });
      });
      // print(response.body);
      // print("///////////////");
    } on SocketException catch (_) {
      return Future.error(URL.NO_INTERNET_CONNECTION);
    } catch (error) {
      print(error);
      return Future.error(URL.SERVER_ERROR);
    }
  }
}
/*
var request = new http.MultipartRequest("POST", url);
request.fields['user'] = 'someone@somewhere.com';
request.files.add(http.MultipartFile.fromPath(
    'package',
    'build/package.tar.gz',
    contentType: new MediaType('application', 'x-tar'),
));
request.send().then((response) {
  if (response.statusCode == 200) print("Uploaded!");
});
*/