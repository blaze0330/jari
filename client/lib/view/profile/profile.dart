import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/view_models/controller/profile/profile_view_model.dart';

import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
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
    return Scaffold(body: Obx(() {
      switch (getuserVM.rxRequestStatus.value) {
        case Status.LOADING:
          return const Center(child: CircularProgressIndicator());
        case Status.ERROR:
          if (getuserVM.error.value == 'No internet') {
            return InterNetExceptionWidget(
              onPress: () {
                getuserVM.userApi();
              },
            );
          } else {
            return GeneralExceptionWidget(onPress: () {
              getuserVM.userApi();
            });
          }
        case Status.COMPLETED:
          return SafeArea(
            child: Column(
              children: [
                Stack(clipBehavior: Clip.none, children: [
                  CachedNetworkImage(
                    imageUrl: getuserVM.user.value.image.toString(),
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      height: MediaQuery.of(context).size.height * .8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                    ),
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
      }
    }));
  }
}
