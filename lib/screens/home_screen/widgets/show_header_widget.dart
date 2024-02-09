import "package:doctor/consts/consts.dart";
import "package:flutter_svg/svg.dart";

import "../../../components/gradient_rounded_container.dart";
import "../../../components/reponsive_text.dart";

Widget showHeaderWidget(context){

  var size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(bottom: containerVerMargin),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            responsiveText(context: context,text:greetText,textColor: black,fontWeight: FontWeight.w500,),
            responsiveText(context: context,text:userName,textColor: black,fontWeight: FontWeight.w600,size: 18.0),
          ],
        ),
        CircleAvatar(
          child: gradientRoundedContainer(
              context: context,
              borderRadius: smallBorderRadius,
              child: SvgPicture.asset("assets/images/icons/$user",color: Colors.white,)
          ),
        ),
      ],
    ),
  );
}