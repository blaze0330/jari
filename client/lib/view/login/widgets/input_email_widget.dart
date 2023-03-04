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
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: "email",
            hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
