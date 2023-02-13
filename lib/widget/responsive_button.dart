import 'package:beginners_flutter/misc/colors.dart';
import 'package:beginners_flutter/widget/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({Key? key, this.width=120, this.isResponsive = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: isResponsive == true ? double.maxFinite: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
           color: AppColors.mainColor
        ),
        child: Row(
          //isRsponsive가 true이면 길쭉한 버튼을 만들것이고 아니면 조그만거라서
          //아래의 조건으로 바꿔준다
          mainAxisAlignment:
          isResponsive==true ? MainAxisAlignment.spaceEvenly:MainAxisAlignment.center,
          children: [
            isResponsive==true ? AppText(text: "Book Trip Now", color:Colors.white,): Container(),
            Image.asset("img/button-one.png"),
          ],
        ),
      ),
    );
  }
}
