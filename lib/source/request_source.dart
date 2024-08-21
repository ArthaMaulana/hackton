import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:flutter_day2/models/response_get_request';
import 'package:http/http.dart' as http;

class RequestSource {
  static Future<ResponseGetRequest?> getRequest(String token) async {
    String url = "https://depool.site/bootcamp/public/api/dashboard/dashboard";
    final headers = {
      "content-type": "application/json",
      'Auhorization': 'Bearer $token',
    };
    print("========");
    print(token);
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      DMethod.logResponse(response);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        ResponseGetRequest responseGetRequest =
            ResponseGetRequest.fromJson(data);
        return responseGetRequest;
      } else {
        return null;
      }
    } catch (e) {
      DMethod.log(e.toString());
      return null;
    }
  }
}
