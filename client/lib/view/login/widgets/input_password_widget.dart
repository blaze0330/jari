

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  final authVM;
  InputPasswordWidget({Key? key , required this.authVM}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: authVM.passwordController.value,
      focusNode: authVM.passwordFocusNode.value,
      obscureText: true,
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('Password', 'Enter password');
        }
      },
      onFieldSubmitted: (value){

      },
      decoration: InputDecoration(
          hintText: 'password_hint'.tr,
          border: OutlineInputBorder()
      ),
    );
  }
}
