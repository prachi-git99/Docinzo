import 'dart:math';

import 'package:doctor/consts/consts.dart';

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}

Widget responsiveText({context, text, textColor, fontWeight, size}) {
  return Text("${text[0].toUpperCase()}${text.substring(1)}",
      textScaleFactor: ScaleSize.textScaleFactor(context),
      softWrap: true,
      maxLines: 3,
      style: TextStyle(
          color: textColor,
          fontSize: size,
          overflow: TextOverflow.ellipsis,
          fontFamily: poppins,
          fontWeight: fontWeight));
}
