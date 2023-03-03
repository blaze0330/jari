

import 'dart:ui';

import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class AuthRepository {

  final _apiService  = NetworkApiServices() ;


  Future<dynamic> authApi(var data , String url) async{
    dynamic response = await _apiService.postApi(data, url);
    return response ;
  }



}