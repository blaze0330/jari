
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
  final homeController = Get.put(HomeController());


  RxBool loading = false.obs;
  RxInt completedCount = 0.obs;

  

  void incrementCount (int i){
    completedCount.value = i;
  }
  void changeCount (int i){
    homeController.userListApi();
    completedCount.value = homeController.userList[i].completedCount;
  }

  void updateCount(String id) {
    loading.value = true;
    Map<String, String> data = {
     
    };

    String url = AppUrl.updateCompletedCount+id;

    _api.updateCompletedCount(jsonEncode(data),id,url).then((value) {
      
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
