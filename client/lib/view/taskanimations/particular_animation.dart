import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getx_mvvm/res/components/neumorphism.dart';
import 'package:getx_mvvm/view/add_task/widgets/round_color_container.dart';

import 'package:rive/rive.dart';

import '../../res/assets/image_assets.dart';

class ParticularAnimation extends StatefulWidget {
  final animationtask;
  const ParticularAnimation({super.key, required this.animationtask});

  @override
  State<ParticularAnimation> createState() => _ParticularAnimationState();
}

class _ParticularAnimationState extends State<ParticularAnimation> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  final rives = [RiveAssets.bar, RiveAssets.tree, RiveAssets.watercup];

  final List<Color> rang = [Color(0xff161b2a), Color(0xff4d4c61), Colors.white];
  final List<Color> rangTitle = [Colors.white , Colors.white , Colors.black];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rang[widget.animationtask.animationType],
      body: SafeArea(
        child: Column(
          
          children: [
            SizedBox(height: 40,),
            Text(widget.animationtask.title.toString() , style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: rangTitle[widget.animationtask.animationType]
            ),),
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
                      inputValue?.change(1);
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
                  onPressed: () {},
                  child: Icon(Icons.add),
                ),
                ColouredContainer(
                  radius: 50.0,
                  color: Colors.yellow,
                    height: 70.00,
                    width: 70.00,
                    child: Center(
                      child: Text(widget.animationtask.completedCount.toString()),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
