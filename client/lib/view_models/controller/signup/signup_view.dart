import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/repository/signup_repository/signup_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

class SignUpViewModel extends GetxController {
  final _api = SignUpRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void SignUpApi() {
    loading.value = true;
    Map<String, String> data = {
      'email': emailController.value.text.toString(),
      'password': passwordController.value.text.toString()
    };
    _api.SignUpApi(jsonEncode(data)).then((value) {
      loading.value = false;
      print('hi ${value}');

      if (value['success'] == false) {
        
        Utils.snackBar('Login', value['error']);
      } else {
        print("right email");
        UserModel userModel = UserModel.fromJson(value);

        userPreference.saveUser(userModel).then((value) {
          // releasing resouces because we are not going to use this
          Get.delete<SignUpViewModel>();
          Get.toNamed(RouteName.homeView)!.then((value) {});
          Utils.snackBar('SignUp', 'SignUp successfully');
        }).onError((error, stackTrace) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
