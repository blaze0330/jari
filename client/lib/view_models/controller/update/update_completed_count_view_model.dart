
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/repository/update/update_completed_count.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

import '../home/home_view_models.dart';

class UpdateCompleteCountController extends GetxController {

  final _api = UpdateCompleteCountRepository();



  RxBool loading = false.obs;
  RxList list = [].obs;

  incrementListCount(int index){
    list.value[index]++;
  }

  setList(List countList){
    list.value = countList;
  }

  removeListCount(index){
    list.removeAt(index);
  }
  

  

  void updateCount(String id , String initurl) {
    loading.value = true;
    Map<String, String> data = {
     
    };

    String url = initurl+id;

    _api.updateCompletedCount(jsonEncode(data),id,url).then((value) {
      
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
