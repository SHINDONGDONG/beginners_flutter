import 'package:beginners_flutter/misc/colors.dart';
import 'package:beginners_flutter/widget/app_large_text.dart';
import 'package:beginners_flutter/widget/app_text.dart';
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
            ), //디스커버 컨테이너
            const SizedBox(height: 40),
            //tabbar
            Container(
              child: Align(
                //Align으로 감싸고 가운데 왼쪽으로
                alignment: Alignment.centerLeft,
                child: TabBar(
                  //탭바
                  //탭바의 라벨패딩을 정한다.
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  //Scroll가능하게 함 클릭도 가능
                  isScrollable: true,
                  //인디케이터가 라벨크기만큼으로 정해진다.
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:
                      CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                  labelColor: Colors.black,
                  //탭바 라벨컬러
                  controller: _tabController,
                  //컨트롤러 선언
                  tabs: const [
                    //탭의 이름
                    Tab(text: "Places"),
                    Tab(text: "Inspiration"),
                    Tab(text: "Emotions"),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300, //Tabbarview는 크기를 알아야지 거기에 컨텐츠를 넣을수잇다.
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController, //마찬가지로 탭 컨트롤러
                children: [
                  //뷰에 들어갈 컨텐츠들.
                  ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage("img/mountain.jpg"),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),
                  Text("There"),
                  Text("Bye"),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: "Explore More"),
                  AppText(text: "See all"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: double.maxFinite,
              // margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        Container(
                          // margin: EdgeInsets.only(right: 50),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("img/mountain.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          child: AppText(text: "Kayyaking"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//데코레이션을 extends로 받아주어야 decoration에서 적용가능하다.
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

//Decoration 그림을 그리는 페인터임.
class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
