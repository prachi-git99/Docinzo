import 'package:doctor/consts/consts.dart';

Widget roundedCornerContainer(
    {width, height, color, child, borderRadius, blur = 0.0, spread = 0.0}) {
  return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: 1.2 * containerHorPadd, vertical: containerVerPadd),
      margin: EdgeInsets.symmetric(horizontal: containerHorMargin / 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
          boxShadow: [
            BoxShadow(color: shadow, spreadRadius: spread, blurRadius: blur)
          ]),
      child: child);
}
