

import 'dart:ui';

import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class HomeRepository {
  
  final _apiService  = NetworkApiServices() ;
  Future<List<Task>> TaskList() async{
    List<Task> taskList = [];
    dynamic response = await _apiService.getApi(AppUrl.fetchalltasks);
    for (Map<String,dynamic> i in response) {
      taskList.add(Task.fromJson(i));
    }
    return taskList ;
  }


}