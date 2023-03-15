import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../res/components/neumorphism.dart';

class OrderList extends StatelessWidget {
  final userList;
  const OrderList({super.key, this.userList});

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  
                       ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: userList
                              .length, //Rxlist can be used without using .value even if we remove it , it's perfectly fine
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                
                                
                                  Container(
                                   
                                    child: Row(
                                      children: [
                                        SizedBox(width: 30,),
                                        Text((index+1).toString() ,style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20
                                        ),),
                                        SizedBox(width: 30,),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(userList[index].image),
                                          radius: 30,
                                        ),
                                        SizedBox(width: 20,),
                                        Text(
                                            userList[index].name
                                            .toString(),style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20
                                        ),),
                                      
                                         new Spacer(),
                                        Text(
                                            userList[index].completedTasks
                                            .toString(),style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20
                                        ),),
                                        SizedBox(width: 10,),
                                        Text(
                                            "points"),
                                            SizedBox(width: 40,)

                                      ],
                                    ),
                                  ),
                               
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            );
                          }),
                ],
              ),
            );
  }
}