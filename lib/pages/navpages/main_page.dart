import 'package:beginners_flutter/pages/navpages/bar_item_page.dart';
import 'package:beginners_flutter/pages/navpages/home_page.dart';
import 'package:beginners_flutter/pages/navpages/my_page.dart';
import 'package:beginners_flutter/pages/navpages/search_page.dart';
import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //네비게이션에서 옮겨갈 페이지들
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage()
  ];

  //tab의 인덱스를 색인할것임
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex], //바디에 hompage()가 표시될것이다 로드되면.
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54, //선택될때 컬러
        unselectedItemColor: Colors.grey.withOpacity(0.5), //선택해제 컬러
        showUnselectedLabels: false, //라벨노표시
        showSelectedLabels: false,
        elevation: 0, //모름
        items: const [ //items에서 bottomnavigationbaritem이 무조건 들어가야한다.
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Apps"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),label:" Chart"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "person"),
        ],
      ),
    );
  }
}
