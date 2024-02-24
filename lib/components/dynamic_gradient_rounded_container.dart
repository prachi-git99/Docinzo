import 'package:doctor/consts/consts.dart';

Widget dynamicGradientRoundedContainer(
    {context, gradient, borderRadius, height, width, child, blur = 0.0}) {
  return Container(
      height: height,
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: containerHorPadd, vertical: containerVerPadd),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: gradient,
          boxShadow: [
            BoxShadow(color: shadow, spreadRadius: 0, blurRadius: blur)
          ]),
      child: child);
}
