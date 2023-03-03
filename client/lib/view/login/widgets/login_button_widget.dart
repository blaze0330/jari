

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
    return  Obx(() => RoundButton(
        width: 200,
        title: authText,
        loading: authVM.loading.value,
        onPress: (){
          if(formKey.currentState!.validate()){
            authVM.authApi(url);
          }
        }
    ));
  }
}
