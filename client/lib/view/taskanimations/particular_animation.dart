import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_mvvm/res/components/neumorphism.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/add_task/widgets/round_color_container.dart';
import 'package:getx_mvvm/view_models/controller/profile/profile_view_model.dart';
import 'package:getx_mvvm/view_models/controller/update/update_completed_count_view_model.dart';

import 'package:rive/rive.dart';

import '../../res/app_url/app_url.dart';
import '../../res/assets/image_assets.dart';
import '../../view_models/controller/home/home_view_models.dart';

class ParticularAnimation extends StatefulWidget {
  final animationtask;
  final position;
  const ParticularAnimation(
      {super.key, required this.animationtask, this.position});

  @override
  State<ParticularAnimation> createState() => _ParticularAnimationState();
}

class _ParticularAnimationState extends State<ParticularAnimation> {
  final updatevm = Get.put(UpdateCompleteCountController());
  final homeController = Get.put(HomeController());
  final getuserVM = Get.put(GetUserController());

  StateMachineController? controller;
  SMIInput<double>? inputValue;
  final rives = [RiveAssets.bar, RiveAssets.watercup, RiveAssets.tree];

  final List<Color> rang = [Color(0xff161b2a), Colors.white, Color(0xff4d4c61)];
  final List<Color> rangTitle = [Colors.white, Colors.black, Colors.white];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
    getuserVM.userApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rang[widget.animationtask.animationType],
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            widget.animationtask.title.toString(),
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: rangTitle[widget.animationtask.animationType]),
          ),
          Container(
              height: MediaQuery.of(context).size.height * .67,
              child: RiveAnimation.asset(
                rives[widget.animationtask.animationType],
                fit: BoxFit.fitWidth,
                onInit: (artboard) {
                  controller = StateMachineController.fromArtboard(
                    artboard,
                    "State Machine 1",
                  );

                  if (controller != null) {
                    artboard.addController(controller!);
                    inputValue = controller?.findInput("input");
                    inputValue?.change((100 / widget.animationtask.totalCount) *
                        widget.animationtask.completedCount);
                  }
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ColouredContainer(
                  radius: 50.0,
                  color: Colors.yellow,
                  height: 70.00,
                  width: 70.00,
                  child: Center(
                    child: Text(widget.animationtask.totalCount.toString()),
                  )),
              FloatingActionButton(
                onPressed: () {
                  updatevm.updateCount(widget.animationtask.sId.toString(), AppUrl.updateCompletedCount);
                  updatevm.incrementListCount(widget.position);
                  inputValue?.change((100 / widget.animationtask.totalCount) *
                      (updatevm.list[widget.position]).toInt());
                  if (updatevm.list[widget.position].toString() ==
                      widget.animationtask.totalCount.toString()) {
                        print(getuserVM.user.value.sId.toString());
                        updatevm.updateCount(getuserVM.user.value.sId.toString(), AppUrl.updateCompletedTasks);
                    updatevm.removeListCount(widget.position);
                    Get.toNamed(RouteName.completedanimation);
                  }
                },
                child: Icon(Icons.add),
              ),
              ColouredContainer(
                  radius: 50.0,
                  color: Colors.yellow,
                  height: 70.00,
                  width: 70.00,
                  child: Center(
                    child: Obx(() {
                      return Text(updatevm.list[widget.position].toString());
                    }),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
