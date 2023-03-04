import 'package:flutter/material.dart';

import '../../res/bottomnavigationbar_url/bottomnavigationbar.dart';



class BtmNavBar extends StatefulWidget {
  const BtmNavBar({super.key});

  @override
  State<BtmNavBar> createState() => _BtmNavBarState();
}

class _BtmNavBarState extends State<BtmNavBar> {
  int pagedx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: ((index) {
          setState(() {
            pagedx = index;
          });
        }),
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
}