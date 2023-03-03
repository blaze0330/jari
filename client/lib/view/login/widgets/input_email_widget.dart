import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';
import '../../../view_models/controller/signup/signup_view.dart';

class InputEmailWidget extends StatelessWidget {
  String controller;
  InputEmailWidget({Key? key, required this.controller}) : super(key: key);

  if(controller == "login"){
    final VM = Get.put(LoginViewModel());
  }
  else{
    final VM = Get.put(SignUpViewModel());
  }

  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: VM.emailController.value,
      focusNode: VM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar('Email', 'Enter email');
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(
            context, VM.emailFocusNode.value, VM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr, border: OutlineInputBorder()),
    );
  }
}
