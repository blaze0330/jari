

import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountPreference {

    Future<bool> saveCount(List<String> countList)async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setStringList("list",countList);
      return true;
    }

    Future<List<String>?> getCount()async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      List<String>? token = sp.getStringList('List');
     

     return token;
    }

    Future<bool> removeCount()async{
      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.clear();
      return true ;
    }
}