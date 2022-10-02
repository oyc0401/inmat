import 'package:flutter/material.dart';
import 'package:restaurant/Widget/Profile.dart';

import 'Community.dart';
import 'Search.dart';
import 'home.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNav(),
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
    );
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 12,

      currentIndex: _selectedIndex,
      //현재 선택된 Index
      onTap: (int index) {
        // switch(index){
        //   case 1:
        //     Provider.of<UnivSearchModel>(context,listen: false).InitUnivDatas();
        // }
        setState(() {
          _selectedIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          label: "홈",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "검색",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "커뮤니티",
          icon: Icon(Icons.question_answer),
        ),
        BottomNavigationBarItem(
          label: "내 정보",
          icon: Icon(Icons.account_circle),
        ),
      ],
    );
  }

  List _widgetOptions() {
    return [
      const Home(),
      const Search(),
      const Community(),
      const Profile(),
    ];
  }
}
