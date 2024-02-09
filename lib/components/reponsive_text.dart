import 'dart:math';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:doctor/consts/consts.dart';
import 'package:flutter/material.dart';


class ScaleSize {
  static double textScaleFactor(BuildContext context, {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

Widget responsiveText({context,text,textColor,fontWeight,size}){
  return Text(
    "${text[0].toUpperCase()}${text.substring(1)}",
      textScaleFactor: ScaleSize.textScaleFactor(context),
    style: TextStyle(color: textColor,
        fontSize: size,
        fontFamily: poppins,
        fontWeight: fontWeight)
  );

}

