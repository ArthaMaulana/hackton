import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:flutter_day2/models/respone_login.dart';
import 'package:http/http.dart' as http;

class AuthSource {
  static Future<ResponseSignIn?> getSignIn(
      String email, String password) async {
    String url = "https://depool.site/bootcamp/public/api/auth/login";
    final headers = {"content-type": "application/json"};
    try {
      final response = await http.post(Uri.parse(url), // url nya
          headers: headers, // headers nya
          body: jsonEncode({"email": email, "password": password})); //body nya
      // DMethod.logResponse(response);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        ResponseSignIn responseSignIn = ResponseSignIn.fromJson(data);
        DMethod.log(responseSignIn.accessToken.toString());
        return responseSignIn;
      } else {
        return null;
      }
    } catch (e) {
      DMethod.log(e.toString());
      return null;
    }
  }
}
