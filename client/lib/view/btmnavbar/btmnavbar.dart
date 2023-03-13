import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/bottomnavigationbar_url/bottomnavigationbar.dart';
import '../../view_models/controller/home/home_view_models.dart';
import '../../view_models/controller/update/update_completed_count_view_model.dart';

class BtmNavBar extends StatefulWidget {
  int pagedx = 0;
  final homeController = Get.put(HomeController());
  final updatevm = Get.put(UpdateCompleteCountController());
  BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => BtmNavBarState();
}

class BtmNavBarState extends State<BtmNavBar> {
  int pagedx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (setpagedx),
        currentIndex: pagedx,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.animation,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.leaderboard,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25,
              ),
              label: ""),
        ],
      ),
      body: pageindex[pagedx],
    );
  }

  void setpagedx(index) {
    
    setState(() {
      pagedx = index;
    });
  }
}
