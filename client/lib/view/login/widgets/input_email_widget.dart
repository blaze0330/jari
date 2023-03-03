import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputEmailWidget<T> extends StatelessWidget {
  final authVM;
  InputEmailWidget({Key? key , required this.authVM}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: authVM.emailController.value,
      focusNode: authVM.emailFocusNode.value,

      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('Email', 'Enter email');
        }
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, authVM.emailFocusNode.value, authVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: 'email_hint'.tr,
          border: OutlineInputBorder()
      ),
    );
  }
}
