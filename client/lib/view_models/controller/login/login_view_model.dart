import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/user_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

class AuthViewModel extends GetxController {
  final _api = AuthRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final nameController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  // final nameFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void authApi(String url) {
    loading.value = true;
    Map<String, String> data = {
      if (nameController.value.text.isNotEmpty)
        'name': nameController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text
    };

    _api.authApi(jsonEncode(data), url).then((value) {
      loading.value = false;
      print('hi ${value}');

      if (value['success'] == false) {
        Utils.snackBar('Login', value['error']);
      } else {
        print("right email");
        UserModel userModel = UserModel.fromJson(value);

        userPreference.saveUser(userModel).then((value) {
          // releasing resouces because we are not going to use this
          Get.delete<AuthViewModel>();
          Get.toNamed(RouteName.homeView)!.then((value) {});
          Utils.snackBar('Login', 'Login successfully');
        }).onError((error, stackTrace) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}
