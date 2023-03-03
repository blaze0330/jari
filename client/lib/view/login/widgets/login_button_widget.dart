

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey ;
  String url;
  String authText ;
  final authVM ;
   LoginButtonWidget({Key? key , required this.formKey , required this.authText , required this.url, required this.authVM}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return  Obx(() =>
    GestureDetector(
      onTap: (){
          if(formKey.currentState!.validate()){
            authVM.authApi(url);
          }
        },
      child: authVM.loading.value ? CircularProgressIndicator() : Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            authText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    )
    );
  }
}


       