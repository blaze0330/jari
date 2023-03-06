import 'package:flutter/material.dart';

import '../../res/bottomnavigationbar_url/bottomnavigationbar.dart';



class BtmNavBar extends StatefulWidget {
  int pagedx = 0;
  BtmNavBar({super.key  });

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
            icon: Icon(Icons.home , size: 25,
            
            ),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.animation, size: 25 ,

            ),
            label: ""
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard , size: 25,

            ),
            label : ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 25,

            ) ,
            label : ""
          ),
        
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