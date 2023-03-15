import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';

import 'package:getx_mvvm/res/components/general_exception.dart';

import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/taskanimations/particular_animation.dart';
import 'package:getx_mvvm/view_models/controller/update/update_completed_count_view_model.dart';

import '../../res/components/empty_page.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../view_models/controller/home/home_view_models.dart';

class TaskAnimations extends StatefulWidget {
  TaskAnimations({Key? key}) : super(key: key);

  @override
  State<TaskAnimations> createState() => _TaskAnimationsState();
}

class _TaskAnimationsState extends State<TaskAnimations> {
  final homeController = Get.put(HomeController());
  final updatevm = Get.put(UpdateCompleteCountController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    homeController.userListApi();
    
   
    
  }

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeController.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {
                  homeController.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeController.refreshApi();
              });
            } 
          case Status.COMPLETED:
            return 
                
                homeController.userList.isEmpty? EmptyPage() : PageView.builder(
                
                  physics: ScrollPhysics(),
                  
                                
                  itemBuilder: (context, index) {
                    return ParticularAnimation(animationtask: homeController.userList[index],position: index,);
                  },
                  itemCount: homeController.userList.length, 
                  onPageChanged: (value){
                    
                    
                   
                    
                  },
                );
             
        }
      }
    );
  }
}
