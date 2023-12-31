import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';

import '../../view_models/controller/home/home_view_models.dart';

class CompletedTask extends StatefulWidget {
  final homeController = Get.put(HomeController());
   CompletedTask({super.key});

  @override
  State<CompletedTask> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTask> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.homeController.userListApi();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xfffebb17),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(icon: Icon(Icons.home , color: Colors.white, size: 30,) ,
              onPressed: () => Get.toNamed(RouteName.btmnavbar),
              
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                
                height: 350,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20,),
                    CircleAvatar(
                      backgroundImage: AssetImage(ImageAssets.congrats) ,
                      radius: 100,
                    ),
                    SizedBox(height : 45),
                    Text("Congratulations!" , style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10,),
                    Text("You did it!")
      
      
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}