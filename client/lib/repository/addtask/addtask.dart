

import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';


class AddTaskRepository {

  final _apiService  = NetworkApiServices() ;


  Future<dynamic> addTask(var data ) async{
    dynamic response = await _apiService.postApi(data , AppUrl.addtask);
    return response ;
  }



}