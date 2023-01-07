

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../community/commu.dart';
import '../profile/Profile.dart';
import '../spinner/RandomFoodSelect.dart';
import '../search/Search.dart';
import '../community/Community.dart';
import '../home/home.dart';

import 'main_model.dart';

class NavigatePage extends StatefulWidget {
  const NavigatePage({Key? key}) : super(key: key);

  @override
  State<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends State<NavigatePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => HomeModel()),
      ],
      child: Scaffold(
        bottomNavigationBar: bottomNav(),
        body: Center(
          child: _widgetOptions().elementAt(_selectedIndex),
        ),
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
          label: "랜덤",
          icon: Icon(Icons.menu_book),
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
      const RandomFoodSelect(),
      const Community(),
      const ProfilePage(),
    ];
  }
}
