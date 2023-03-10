import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';
import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';
class Profile extends StatelessWidget {
  Profile({super.key});
  UserPreference userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Icon(Icons.logout , size: 100,),
          
        ),
        onTap: () {
          userPreference.removeUser().then((value){
              Get.toNamed(RouteName.loginView);
        });},
      )
    );
  }
}