
import 'dart:ffi';

import 'package:getx_mvvm/res/app_url/app_url.dart';

import '../../data/network/network_api_services.dart';
import '../../models/getuser/get_user_model.dart';

class GetUserRepository{
   final _apiService  = NetworkApiServices() ;

   Future<dynamic> getUser() async{
    dynamic response = await _apiService.getApi(AppUrl.getUser);
    return GetUserModel.fromJson(response);
   }
}