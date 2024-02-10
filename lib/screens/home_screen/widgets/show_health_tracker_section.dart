import "package:doctor/components/gradient_rounded_container.dart";
import "package:doctor/consts/consts.dart";

import "../../../components/responsive_text.dart";

Widget showHealthTrackerSection(context) {
  var size = MediaQuery.of(context).size;
  var aspectRatio = (size.width * 0.41)/(size.height * 0.31);
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            2,
            (index) => Container(
              width: size.width*0.43,
              margin: EdgeInsets.symmetric(vertical: containerVerMargin),
              padding: EdgeInsets.symmetric(vertical: containerVerMargin,horizontal: containerHorPadd),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(smallBorderRadius),
                color: white,
                  boxShadow: [
                    BoxShadow(color: shadow, spreadRadius: 0, blurRadius: 10.0),
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  gradientRoundedContainer(
                    context: context,
                    borderRadius: 99.0,
                    width: size.width*0.2,
                    height: size.width*0.2,
                    child: Image.asset("assets/images/${healthGrid[index]['icon']}",fit: BoxFit.cover,)
                  ),
                  responsiveText(
                      context: context,
                      text:"${healthGrid[index]['title']}",
                      textColor: black,
                      fontWeight: FontWeight.w500,
                      size: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      responsiveText(
                          context: context,
                          text:"${healthGrid[index]['value']}",
                          textColor: black,
                          fontWeight: FontWeight.w600,
                          size: 26.0),
                      responsiveText(
                          context: context,
                          text:"${healthGrid[index]['unit']}",
                          textColor: black,
                          fontWeight: FontWeight.w300,
                          size: 12.0),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      responsiveText(
                          context: context,
                          text:lastUpdate,
                          textColor: black.withOpacity(0.4),
                          fontWeight: FontWeight.w200,
                          size: 12.0),
                      responsiveText(
                          context: context,
                          text:" ${healthGrid[index]['date']}",
                          textColor: black,
                          fontWeight: FontWeight.w400,
                          size: 12.0),
                    ],
                  ),



                ],
              ),
            )),
      ),

      Container(
        width: size.width,
          margin: EdgeInsets.symmetric(vertical: containerVerMargin,horizontal: 5.0),
          padding: EdgeInsets.symmetric(vertical: 2*containerVerMargin),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(smallBorderRadius),
              color: white,
              boxShadow: [
                BoxShadow(color: shadow, spreadRadius: 0, blurRadius: 10.0),
              ]
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: containerVerMargin),
              width: size.width*0.4,
              height: size.width*0.2,
              child: Image.asset("assets/images/${healthGrid[2]['icon']}",color: primaryColor,fit: BoxFit.cover),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsiveText(
                    context: context,
                    text:"${healthGrid[2]['title']}",
                    textColor: black,
                    fontWeight: FontWeight.w500,
                    size: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    responsiveText(
                        context: context,
                        text:"${healthGrid[2]['value']}",
                        textColor: black,
                        fontWeight: FontWeight.w600,
                        size: 22.0),
                    responsiveText(
                        context: context,
                        text:"${healthGrid[2]['unit']}",
                        textColor: black,
                        fontWeight: FontWeight.w300,
                        size: 10.0),
                  ],
                ),
                SizedBox(height: containerVerMargin,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    responsiveText(
                        context: context,
                        text:lastUpdate,
                        textColor: black.withOpacity(0.4),
                        fontWeight: FontWeight.w200,
                        size: 12.0),
                    responsiveText(
                        context: context,
                        text:" ${healthGrid[2]['date']}",
                        textColor: black,
                        fontWeight: FontWeight.w400,
                        size: 12.0),
                  ],
                ),

              ],
            ),
          ],
        ),
      )
    ],
  );
}
