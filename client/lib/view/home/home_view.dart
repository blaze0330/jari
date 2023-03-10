import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/neumorphism.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

import '../../res/components/internet_exceptions_widget.dart';
import '../../view_models/controller/home/home_view_models.dart';
 
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final homeController = Get.put(HomeController());

  UserPreference userPreference = UserPreference();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFEFEEEE),
      
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(homeController.error.value =='No internet'){
              return InterNetExceptionWidget(onPress: () {
                homeController.refreshApi();
              },);
            }else {
              return GeneralExceptionWidget(onPress: (){
                homeController.refreshApi();
              });
            }
          case Status.COMPLETED:
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50,),
                  FloatingActionButton(onPressed: (){Get.toNamed(RouteName.addTask);} , child: const Center(child: Icon(Icons.add,)),),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: homeController.userList.length, //Rxlist can be used without using .value even if we remove it , it's perfectly fine
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.taskanimation , arguments: [homeController.userList[index].sId.toString()]);
                              },
                              child: NeuMorphism(
                                height: 50,
                                width: 350,
                                child: Center(child: Text(homeController.userList[index].title.toString())),
                                        
                              ),
                            ),
                            SizedBox(height: 10,)
                            
                          ],
                        );
                      }
                  ),
                ],
              ),
            );
        }
      }),
    );
  }
}
