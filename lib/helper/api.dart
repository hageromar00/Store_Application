import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class API {
  Future<dynamic> getService({required String URI, @required String? token}) async{
    Map<String, String> header = {};
    if (token != null) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response= await http.get(Uri.Parse(URI), header:header);
    if(response.statusCode==200){
      return JsonDecode(response.body);
    }
    else{
      throw Exception("Response is error: " + response.status)
    }


  }
}
