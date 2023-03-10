import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:getx_mvvm/repository/addtask/addtask.dart';

import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
 
class AddTaskController extends GetxController {
  final _api = AddTaskRepository();

  final titleController = TextEditingController().obs;
  final totalCountController = TextEditingController().obs;
  final copletedCountController = TextEditingController().obs;
  final animationType = 0.obs;
  final ayush = "".obs;
  changeayush(){
    ayush.value = "sahil";
  }
  RxList<double> opacity = [.5,.5,.5].obs;
  toogleOpcaity(int index){
    animationType.value = index;
    for (var i = 0; i < opacity.length; i++) {
       if (i==index) {
        opacity.value[i]= 1.0;
      }else{ opacity.value[i] = .5;}
     
    }
    print(opacity.value);
  }


  final titleFocusNode = FocusNode().obs;
  final totalCountFocusNode = FocusNode().obs;
  final completedCountFocusNode = FocusNode().obs;
  final animationTypeFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void addtaskApi() {
    loading.value = true;
    Map<dynamic, dynamic> data = {
      'title' : titleController.value.text,
      'totalCount' : int.parse(totalCountController.value.text),
      'animationType' : animationType.value
    };

    _api.addTask(jsonEncode(data)).then((value) {
      loading.value = false;
     
        Get.delete<AddTaskController>();
   
        Get.toNamed(RouteName.taskanimation , arguments: [value['_id']]);
      }
    ).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
