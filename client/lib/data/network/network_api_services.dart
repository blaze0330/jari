import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';
import 'package:http/http.dart' as http;

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "auth-token": await UserPreference().getUser().then((value) => value.toJson()['authtoken']),
        },
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } catch (e) {
      print(e);
      if (e is SocketException) {
        print(e);
      } else
        throw RequestTimeOut('');
    }
    return responseJson;

  }

  @override
  Future<dynamic> postApi(var data, String url , Map<String,String> headers) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
        headers: headers
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } catch (e) {
      if (e is SocketException) {
        // print(e.toString());
        throw InternetException(e.message);
      } else {
        print(e);
        throw RequestTimeOut();
      }
    } 
    if (kDebugMode) {
      // print(responseJson);
    }
  
    return responseJson;
  }
  @override
  Future<dynamic> putApi(var data, String url , Map<String,String> headers) async {
    dynamic responseJson;
    try {
      final response = await http.put(
        Uri.parse(url),
        body: data,
        headers: headers
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } catch (e) {
      if (e is SocketException) {
        // print(e.toString());
        throw InternetException(e.message);
      } else {
        print(e);
        throw RequestTimeOut();
      }
    }
    if (kDebugMode) {
      // print(responseJson);
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error accoured while communicating with server ' +
                response.statusCode.toString());
    }
  }
}
