import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/neumorphism.dart';
import 'package:getx_mvvm/view/Leaderboard/widgets/bars.dart';
import 'package:getx_mvvm/view/Leaderboard/widgets/orderlist.dart';
import 'package:getx_mvvm/view_models/controller/all_users/all_users.dart';

import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final homeController = Get.put(AllUsersController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.AlluserListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),

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
           return Column(
            children: [
              Expanded(
                flex: 1,
                child: Bars(userList: homeController.userList,)
                ),
                Divider(
                  height: 0,
                  thickness: 2,
                  color: Colors.grey.shade200,
                  indent: 30,
                  endIndent: 30,
                ),
              Expanded(
                flex: 1,
                child: OrderList(user_List: homeController.userList,)
                ),
            ],
           );
  }
}));}}