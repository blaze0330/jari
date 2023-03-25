import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rive/components.dart';

import '../clipper.dart';

class Bars extends StatefulWidget {
  var newList;
  List userList = [];
  Bars({super.key, this.newList});
  

  @override
  State<Bars> createState() => _BarsState();
}

class _BarsState extends State<Bars> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.userList = widget.newList.map((element) => element ).toList();
    final temp = widget.userList[0];
    widget.userList[0] = widget.userList[1];
    widget.userList[1] = temp;
    
  }

  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
          height: MediaQuery.of(context).size.height * .4,
          decoration: BoxDecoration(color: Color(0xFFfce5ca)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // SizedBox(height: MediaQuery.of(context).size.height * .2,),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: widget.userList!.length < 4
                        ? widget.userList!.length
                        : 3, //Rxlist can be used without using .value even if we remove it , it's perfectly fine
                    itemBuilder: (context, index) {
                      
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CachedNetworkImage(
  imageUrl: widget.userList[index].image.toString(),
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
  imageBuilder: (context, imageProvider) => CircleAvatar(
    backgroundImage: imageProvider,
    radius: 40,
  ),
),
                            AnimatedContainer(
                              duration: const Duration(
                  milliseconds: 370,
                ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFFF9575),
                              ),
                              width: 100,
                              height: 250 *
                                  widget.userList[index].completedTasks /
                                  widget.userList[1].completedTasks,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      child: Text(index == 0 ? "2" : index == 1 ? "1" :(index + 1).toString(),
                                          style: TextStyle(
                                              color: Color(0xFFFF9575))),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
