import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';
import 'package:getx_mvvm/view/login/login_view.dart';

import 'package:getx_mvvm/view/login/widgets/input_email_widget.dart';
import 'package:getx_mvvm/view/login/widgets/input_password_widget.dart';
import 'package:getx_mvvm/view/login/widgets/login_button_widget.dart';
import 'package:getx_mvvm/view/login/widgets/input_name_widget.dart';
import 'package:getx_mvvm/view_models/controller/add_task/add_task.dart';
import 'package:getx_mvvm/view_models/controller/login/login_view_model.dart';

import '../../res/routes/routes_name.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final addtaskVM = Get.put(AddTaskController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
      
              // logo
              const Icon(
                Icons.person,
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
                    InputNameWidget(
                      authVM: addtaskVM,
                    ),
                  
                    const SizedBox(
                      height: 20,
                    ),
                    InputEmailWidget(
                      authVM: addtaskVM,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InputPasswordWidget(
                      authVM: addtaskVM,
                    ),
                  ],
                ),
              ),
      
              const SizedBox(
                height: 40,
              ),
              LoginButtonWidget(
                formKey: _formkey,
                authText: "Sign up",
                url: AppUrl.createUser,
                authVM: addtaskVM,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
