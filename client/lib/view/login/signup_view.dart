import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:getx_mvvm/view/login/login_view.dart';

import 'package:getx_mvvm/view/login/widgets/input_email_widget.dart';
import 'package:getx_mvvm/view/login/widgets/input_password_widget.dart';
import 'package:getx_mvvm/view/login/widgets/login_button_widget.dart';
import 'package:getx_mvvm/view/login/widgets/input_name_widget.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';





class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final signupVM = Get.put(AuthViewModel()) ;
  final _formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading:false,
        title: Text('login'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  InputNameWidget(authVM: signupVM,),
                  const SizedBox(height: 20,),
                  InputEmailWidget(authVM: signupVM,),
                  const SizedBox(height: 20,),
                  InputPasswordWidget(authVM: signupVM,),

                ],
              ),
            ),

            const SizedBox(height: 40,),
            LoginButtonWidget(formKey: _formkey,authText: "Sign up",url: AppUrl.createUser,authVM: signupVM,),
          ],
        ),
      ),
    );
  }
}
