import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../res/components/neumorphism.dart';

class OrderList extends StatefulWidget {
  final user_List;
  
  const OrderList({super.key, this.user_List});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.user_List[0].name);
  }
  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                
                  
                       ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: widget.user_List
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
                                        CachedNetworkImage(
  imageUrl: widget.user_List[index].image,
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
  imageBuilder: (context, imageProvider) => CircleAvatar(
    backgroundImage: imageProvider,
    radius: 30,
  ),
),

                                        SizedBox(width: 20,),
                                        Text(
                                            widget.user_List[index].name
                                            .toString(),style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 20
                                        ),),
                                      
                                         new Spacer(),
                                        Text(
                                            widget.user_List[index].completedTasks
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