



import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:http/http.dart';

import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';


class AuthRepository {

  final _apiService  = NetworkApiServices() ;

  

  Future<dynamic> authApi(var data , String url) async{
    Map<String,String> headers = {
          "Content-Type": "application/json",
          
        };
    dynamic response = await _apiService.postApi(data, url, headers);
    return response ;
  }



}