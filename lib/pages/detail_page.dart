import 'package:beginners_flutter/misc/colors.dart';
import 'package:beginners_flutter/widget/app_large_text.dart';
import 'package:beginners_flutter/widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //기본배경을 컨테이너로 깔아줄것이고.
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        //스택으로 차곡차곡 이미지와 버튼같은것들을 쌓아서 표현해줄것임.
        child: Stack(
          children: [
            //Position을 잡아준다.
            Positioned(
              left: 0,
              right: 0,
              child: Container(

                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/mountain.jpg"), fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 3 -40,
              child: Container(
                padding: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white ,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Yosemite",color: Colors.black.withOpacity(0.8),),
                        AppText(text: "\$250", color: AppColors.mainColor),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.mainColor,),
                        const SizedBox(width: 5,),
                        AppText(text: "USA, California", color: AppColors.textColor1,),

                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
