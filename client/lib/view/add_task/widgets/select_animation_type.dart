import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';

import '../../../view_models/controller/add_task/add_task.dart';

class SelectAnimation extends StatefulWidget {
  const SelectAnimation({super.key});

  @override
  State<SelectAnimation> createState() => _SelectAnimationState();
}

class _SelectAnimationState extends State<SelectAnimation> {
  final AddTaskController addtaskVM = Get.put(AddTaskController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              addtaskVM.toogleOpcaity(0);
              setState(() {
                
              });
            },
            child:Obx(() =>  Opacity(
              opacity: addtaskVM.opacity[0],
              child: const CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(ImageAssets.bar),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          ),
          GestureDetector(
            onTap: () {
              addtaskVM.toogleOpcaity(1);
              setState(() {
                
              });
            },
            child:  Opacity(
              opacity: addtaskVM.opacity[1],
              child: const CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(ImageAssets.watercup),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
         
          GestureDetector(
            onTap: () {
              addtaskVM.toogleOpcaity(2);
              setState(() {
                
              });
            },
            child:Obx(() =>  Opacity(
              opacity: addtaskVM.opacity[2],
              child: const CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(ImageAssets.tree),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          ),
          
          
        ],
      ),
    );
  }
}
