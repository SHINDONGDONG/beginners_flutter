// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage  extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  //Image List를 저장
   List images = [
     "welcome-one.png",
     "welcome-two.png",
     "welcome-three.png",
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pageview빌더로 페이지 슬라이드를 할 수 있게 만든다.
        body: PageView.builder(
          //세로로 스크롤을 할 수있게 만든다.
            scrollDirection: Axis.vertical,
            itemCount: images.length, //페이지는 3개로 지정.
            itemBuilder: ( _ , index){
              return Container( //Container를 보여줄것이다.
                width: double.maxFinite, //폭,높이는 맥스핀잇.
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "img/"+images[index]
                    ),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 150,left: 20,right: 20),
                ),
              );
        })
    );
  }
}
