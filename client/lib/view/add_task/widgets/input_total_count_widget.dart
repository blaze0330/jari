import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/utils.dart';
import '../../../view_models/controller/login/login_view_model.dart';

class InputTotalCountWidget extends StatelessWidget {
  final authVM;
  InputTotalCountWidget({Key? key , required this.authVM}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: authVM.totalCountController.value,
      focusNode: authVM.totalCountFocusNode.value,

      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('Email', 'Enter email');
        }
      },
      keyboardType: TextInputType.numberWithOptions(),
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, authVM.totalCountFocusNode.value, authVM.titleFocusNode.value);
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
            hintText: "No. of tasks",
            hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
