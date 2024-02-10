import 'package:doctor/consts/consts.dart';

Widget roundedCornerContainer({width,height,color,child,borderRadius,blur=0.0}){
  return Container(
    height: height,
    width: width,
    padding: EdgeInsets.symmetric(horizontal: containerHorPadd,vertical:containerVerPadd ),
    margin: EdgeInsets.symmetric(horizontal: containerHorMargin/2,),
    // margin: EdgeInsets.symmetric(horizontal: containerHorPadd,vertical:containerVerPadd ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: color,
      boxShadow: [
        BoxShadow(color: shadow, spreadRadius: 0, blurRadius: blur),
      ]
    ),
    child: child,
  );
}