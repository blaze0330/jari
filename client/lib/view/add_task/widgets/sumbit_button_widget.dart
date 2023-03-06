

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/components/round_button.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class SumbitButtonWidget extends StatefulWidget {
  final formKey ;
  String authText ;
  final authVM ;
   SumbitButtonWidget({Key? key , required this.formKey , required this.authText , required this.authVM}) : super(key: key);

  @override
  State<SumbitButtonWidget> createState() => _SumbitButtonWidgetState();
}

class _SumbitButtonWidgetState extends State<SumbitButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return  Obx(() =>
    GestureDetector(
      onTap: (){
          if(widget.formKey.currentState!.validate()){
            widget.authVM.addtaskApi();
            
          }
        },
      child: widget.authVM.loading.value ? CircularProgressIndicator() : Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.authText,
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


       