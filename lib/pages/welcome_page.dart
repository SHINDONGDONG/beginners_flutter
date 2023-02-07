// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:beginners_flutter/misc/colors.dart';
import 'package:beginners_flutter/widget/app_large_text.dart';
import 'package:beginners_flutter/widget/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/app_text.dart';

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
     "welcome-three.png"
   ];

   List text = [
     "Trips",
     "Travel",
     "Korea",
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
                child: Container( //image위에 차일드로 컨테이너가 올라올것이다.
                  //올라올 때 위에가 150 양옆이 20으로 마진이 벌어질것이다.
                  margin: const EdgeInsets.only(top: 150,left: 20,right: 20),
                  child: Row( //가로로 줄것이고
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column( //그 위에 세로로 줄것이다.
                        crossAxisAlignment: CrossAxisAlignment.start,//텍스트의 길이때문에 Trips가 가운데로 올것이다 alignment해줌.
                         children: [ //로우 컬럼은 무조건 childern해줨
                          AppLargeText(text: text[index]),
                          AppText(text: "Mountain",size: 30),
                          const SizedBox(height: 20,),
                          Container(
                            width: 250,
                            child: AppText(
                              text: "Mountina Hikes give you an incredible sensce of freedom alone with you engrujd test",
                              color: AppColors.textColor2,
                              size: 14,
                            ),
                          ),
                          const SizedBox(height: 40,),
                          ResponsiveButton(width: 120),
                        ],
                      ),
                      Column(
                        children: List.generate(images.length, (indexDots) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index==indexDots? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index==indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3)
                            )
                          );
                        }),
                      )
                    ],
                  ),
                ),
              );
        })
    );
  }
}
