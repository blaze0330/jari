import 'package:flutter/material.dart';

import '../../../utils/utils.dart';


class InputTitleWidget extends StatelessWidget {
  final authVM;
  InputTitleWidget({Key? key , required this.authVM}) : super(key: key);

  
  

  @override 
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: authVM.titleController.value,
      focusNode: authVM.titleFocusNode.value,

      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('Title', 'Enter title');
        }
      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, authVM.titleFocusNode.value, authVM.totalCountFocusNode.value);
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
            hintText:"title",
            hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
