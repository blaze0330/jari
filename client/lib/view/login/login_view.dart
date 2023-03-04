import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/api_response.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view/login/widgets/input_email_widget.dart';
import 'package:getx_mvvm/view/login/widgets/input_password_widget.dart';
import 'package:getx_mvvm/view/login/widgets/login_button_widget.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';
import 'package:http/http.dart';

import '../../data/response/status.dart';
import '../../res/routes/routes_name.dart';



class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final loginVM = Get.put(AuthViewModel()) ;
  final _formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                const SizedBox(height: 100),
                // logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
        
                const SizedBox(height: 50),
        
                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
        
                const SizedBox(height: 25),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    InputEmailWidget(authVM: loginVM,),
                      const SizedBox(height: 10),
        
                  // forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.signupView);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                    const SizedBox(height: 20,),
                    InputPasswordWidget(authVM: loginVM,),
      
                  ],
                ),
              ),
      
              const SizedBox(height: 40,),
              LoginButtonWidget(formKey: _formkey,authText: "Login",url: AppUrl.loginApi,authVM: loginVM,)
            ],
          ),
        ),
      ),
    );
  }
}
