

import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';


class AddTaskRepository {

  final _apiService  = NetworkApiServices() ;


  Future<dynamic> addTask(var data ) async{
     Map<String,String> headers = {
          "Content-Type": "application/json",
          "auth-token": await UserPreference().getUser().then((value) => value.toJson()['authtoken']),
        };
    dynamic response = await _apiService.postApi(data , AppUrl.addtask , headers);
    return response ;
  }



}