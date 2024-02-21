import '../Models/routin.dart';
import 'Utilites/api_connection.dart';
import 'Utilites/urls.dart';

class RoutinController {
  static Future<List<RoutinModel>> get() async {
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
}
