import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view_models/controller/profile/profile_view_model.dart';

import '../../res/routes/routes_name.dart';
import '../../view_models/controller/user_preference/user_prefrence_view_model.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GetUserController getuserVM = Get.put(GetUserController());
  UserPreference userPreference = UserPreference();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserVM.userApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Obx(() {
      return SafeArea(
        child: Column(
          children: [
            Stack(
               clipBehavior: Clip.none ,
              children: [
              
              Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            NetworkImage(getuserVM.user.value.image.toString()),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
              ),
              Positioned(
                top: 15,
                left: 15,
                child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 30,
                    ),
                    onPressed: () {
                      userPreference.removeUser().then((value) {
                        Get.toNamed(RouteName.loginView);
                      });
                    }),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Text(
              getuserVM.user.value.name.toString(),
              style: TextStyle(
                letterSpacing: 8,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            
          ],
        ),
      );
    })));
  }
}
