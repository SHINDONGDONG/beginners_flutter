import 'package:beginners_flutter/misc/colors.dart';
import 'package:beginners_flutter/widget/app_buttons.dart';
import 'package:beginners_flutter/widget/app_large_text.dart';
import 'package:beginners_flutter/widget/app_text.dart';
import 'package:beginners_flutter/widget/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectIndex = -1;

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
              top: MediaQuery.of(context).size.height / 3 - 40,
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          color: Colors.black.withOpacity(0.8),
                        ),
                        AppText(text: "\$250", color: AppColors.mainColor),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: "USA, California",
                          color: AppColors.textColor1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < 4
                                    ? AppColors.startColor
                                    : AppColors.textColor2);
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AppText(
                          text: "(4.0)",
                          color: AppColors.textColor2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.mainTextColor,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: AppButtons(
                              size: 15,
                              color: selectIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              backgroundColor: selectIndex == index
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.4),
                              borderColor: Colors.grey.withOpacity(0.4),
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    SizedBox(height: 10,),
                    AppText(
                      text:
                          "You must go for a travel. traveling helps get rid of pressure. go to the mountains to see the nature,"
                              "You must go for a travel. traveling helps get rid of pressure. go to the mountains to see the nature"
                      "You must go for a travel. traveling helps get rid of pressure. go to the mountains to see the nature",
                      color: AppColors.mainTextColor,
                    )
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
            Positioned(
              bottom: 30,
              left: 30,
              right: 30,
              child: Row(
              children: [
                AppButtons(size: 10,
                    color: AppColors.textColor2,
                    backgroundColor: Colors.white,
                    borderColor: AppColors.textColor1,
                    isIcon: true,
                    icon: Icons.favorite_border,
                ),
                SizedBox(width: 20,),
                ResponsiveButton(
                  isResponsive: true,
                )
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
