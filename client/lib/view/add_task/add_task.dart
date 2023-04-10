import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view/add_task/widgets/select_animation_type.dart';

import 'package:getx_mvvm/view/add_task/widgets/input_title_widget.dart';
import 'package:getx_mvvm/view/add_task/widgets/input_total_count_widget.dart';
import 'package:getx_mvvm/view/add_task/widgets/sumbit_button_widget.dart';

import 'package:getx_mvvm/view_models/controller/add_task/add_task.dart';


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
      
              
      
             
             
      
            
              Form( 
                key: _formkey,
                child: Column(
                  children: [
                    InputTitleWidget(
                      authVM: addtaskVM,
                    ),
                  
                    const SizedBox(
                      height: 20,
                    ),
                    InputTotalCountWidget(
                      authVM: addtaskVM,
                    ),
                   
                  ],
                ),
              ),
              SizedBox(height: 50,),
              SelectAnimation(),
              SizedBox(height: 50,),
      
              const SizedBox(
                height: 40,
              ),
              SumbitButtonWidget(
                formKey: _formkey,
                authText: "Create!",
                authVM: addtaskVM,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
