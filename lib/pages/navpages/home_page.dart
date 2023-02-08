import 'package:beginners_flutter/widget/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {



  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Expanded(child: Container()),
                  Container(
                    //margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: AppLargeText(text: "Discover"),
            ),   //디스커버 컨테이너
            const SizedBox(height: 40),
            //tabbar
            Container(
              child: TabBar( //탭바
                labelColor: Colors.black, //탭바 라벨컬러
                controller: _tabController, //컨트롤러 선언
                tabs: const [ //탭의 이름
                  Tab(text: "Places"),
                  Tab(text: "Inspiration"),
                  Tab(text: "Emotions"),
                ],
              ),
            ),
            Container(
              height: 300, //Tabbarview는 크기를 알아야지 거기에 컨텐츠를 넣을수잇다.
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController, //마찬가지로 탭 컨트롤러
                children: const [ //뷰에 들어갈 컨텐츠들.
                  Text("Hi"),
                  Text("There"),
                  Text("Bye"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
