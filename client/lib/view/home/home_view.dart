import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';
import 'package:getx_mvvm/res/components/empty_page.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/neumorphism.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_models/controller/user_preference/user_prefrence_view_model.dart';

import '../../res/components/internet_exceptions_widget.dart';
import '../../view_models/controller/all_users/all_users.dart';
import '../../view_models/controller/home/home_view_models.dart';
import '../../view_models/controller/update/update_completed_count_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  final userController = Get.put(AllUsersController());
  final updatevm = Get.put(UpdateCompleteCountController());

  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
    userController.AlluserListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Obx(() {
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
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      Get.toNamed(RouteName.addTask);
                    },
                    child: const Center(
                        child: Icon(
                      Icons.add,
                    )),
                  ),
                  homeController.userList.isEmpty
                      ? EmptyPage()
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: homeController.userList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 30,
                              mainAxisSpacing: 30,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteName.taskanimation,
                                      arguments: [index]);
                                },
                                child: NeuMorphism(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                    child: Text(homeController
                                        .userList[index].title
                                        .toString()),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                ],
              ),
            );
        }
      }),
    );
  }
}
