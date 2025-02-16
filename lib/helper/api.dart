import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class API {
  Future<dynamic> getService(
      {required String URI, @required String? token}) async {
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(URI), headers: header);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
      // return JsonDecode(response.body);
    } else {
      throw Exception("Response is error: $response.statusCode");
    }
  }
   Future<dynamic> putService(
    {required String URI,
    @required String? token,
    @required dynamic body}) async {
  Map<String, String> headers = {};
  // headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
  if (token != null) {
    headers.addAll({"Authorization": "Bearer $token"});
  }
  http.Response response =
      await http.put(Uri.parse(URI), body: body, headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
    // return jsonDecode(response.body);
  } else {
    throw Exception("Unexpected status code: ${response.statusCode}");
  }
}

Future<dynamic> postService(
    {required String URI,
    @required String? token,
    @required dynamic body}) async {
  Map<String, String> headers = {};

  if (token != null) {
    headers.addAll({"Authorization": "Bearer $token"});
  }
  http.Response response =
      await http.post(Uri.parse(URI), body: body, headers: headers);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
    // return jsonDecode(response.body);
  } else {
    throw Exception("Unexpected status code: ${response.statusCode}");
  }
}
}
