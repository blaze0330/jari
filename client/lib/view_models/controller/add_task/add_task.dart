import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/addtask/addtask.dart';

import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';

class AddTaskController extends GetxController {
  final _api = AddTaskRepository();

  RxString title = "".obs;
  RxInt totalCount = 0.obs;
  RxInt copletedCount = 0.obs;
  RxInt animationType = 0.obs;

  final titleFocusNode = FocusNode().obs;
  final totalCountFocusNode = FocusNode().obs;
  final completedCountFocusNode = FocusNode().obs;
  final animationTypeFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void authApi(String url) {
    loading.value = true;
    Map<String, String> data = {};

    _api.addTask(jsonEncode(data)).then((value) {
      loading.value = false;
      print('hi ${value}');

      if (value['success'] == false) {
        Utils.snackBar('oops!', value['error']);
      } else {
        Utils.snackBar('Hurray!!', 'Task Created');
        Get.delete<AddTaskController>();
        Get.toNamed(RouteName.addTask , arguments: [value['_id']]);
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
