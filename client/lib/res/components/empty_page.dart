import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:getx_mvvm/res/assets/image_assets.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.todo),
              fit: BoxFit.contain
              
            ),
            // shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 50,),
        Center(
          child: Text("Oops!.. No Tasks Currently" , style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),),
        )
    
      ],
    );
  }
}
