import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movie_app/enums/snack_bar_type_enum.dart';
import 'package:movie_app/utils/api_routes.dart';
import 'package:movie_app/utils/basic_util.dart';

class ServiceHelper{


  //* GET HEADER
  static Map<String,String> getHeader() {
     return Map<String,String>.of({
      'accept': 'application/json',
      'Authorization': 'Bearer ${ApiRoutes.tmdApiKey}'
     });
  }

  //* HTTP REQUEST TIMEOUT IN SECOND
  static const int httpRequestTimeout = 30;


  static Future sendHttpGetRequest(
      String url,context) async {
    try {
      http.Response response = await http
          .get(Uri.parse(url),)
          .timeout(const Duration(seconds: httpRequestTimeout),);
      var resBody = jsonDecode(response.body);
      return resBody;
    } on http.ClientException catch (error) {
      BasicUtil.showSnackBar(context, error.message, SnackBarType.ERROR);
    } on SocketException catch (error) {
      BasicUtil.showSnackBar(context, error.message, SnackBarType.ERROR);
    } on TimeoutException {
      BasicUtil.showSnackBar(context, 'Timeout', SnackBarType.ERROR);
    }
    return null;
}
}