import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class HttpClient {
  Future<dynamic> request(url,
      {Map<String, String>? headers, dynamic body, required String method});
}

class HttpClientImp implements HttpClient {
  @override
  Future<dynamic> request(url,
      {Map<String, String>? headers, body, required String method}) async {
    try {
      Response? response;

      if (method == 'get') {
        response = await http.get(Uri.parse(url), headers: headers);
      } else if (method == 'post') {
        response =
            await http.post(Uri.parse(url), body: body, headers: headers);
      } else if (method == 'put') {
        response = await http.put(Uri.parse(url), body: body, headers: headers);
      }

      return _handleResponse(response!);
    } catch (e) {
      throw "Server error";
    }
  }

  Map<String, dynamic> _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var bodyBytes = utf8.decode(response.bodyBytes);
        return response.body.isEmpty ? null : jsonDecode(bodyBytes);
      case 400:
        return {"statusCode": 400, "body": jsonDecode(response.body)};
      default:
        throw "Server error";
    }
  }
}
