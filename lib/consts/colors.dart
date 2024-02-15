import 'package:flutter/material.dart';

const Color shadow = Color.fromRGBO(0, 0, 0, 0.07058823529411765);
const Color white = Colors.white;
const Color black = Colors.black;
const Color bgColor = Color.fromRGBO(248, 248, 248, 1);
const Color glassWhite = Color.fromRGBO(255, 255, 255, 0.75);

const Color unselectedNavbarIcon = Color.fromRGBO(171, 171, 171, 1.0);
//blue
const Color primaryColor = Color.fromRGBO(45, 120, 233, 1);
const Color secondaryColor = Color.fromRGBO(117, 164, 231, 1.0);

//yellow
// const Color primaryColor = Color.fromRGBO(227, 153, 63, 1.0);
// const Color secondaryColor = Color.fromRGBO(245, 194, 98, 1.0);

// green
// const Color primaryColor = Color.fromRGBO(92, 241, 164, 1.0);
// const Color secondaryColor = Color.fromRGBO(154, 239, 189, 1.0);

//pink
// const Color primaryColor = Color.fromRGBO(239, 103, 142, 1.0);
// const Color secondaryColor = Color.fromRGBO(248, 133, 171, 1.0);

//peach
// const Color primaryColor = Color.fromRGBO(255, 187, 187, 1.0);
// const Color secondaryColor = Color.fromRGBO(232, 190, 187, 1.0);

//purple
// const Color primaryColor = Color.fromRGBO(165, 92, 241, 1.0);
// const Color secondaryColor = Color.fromRGBO(195, 131, 238, 1.0);

//red
// const Color primaryColor = Color.fromRGBO(241, 91, 91, 1.0);
// const Color secondaryColor = Color.fromRGBO(236, 126, 126, 1.0);

const Color unselectedPieChart = Color.fromRGBO(170, 198, 238, 1.0);

const myGradient = LinearGradient(
  colors: [
    secondaryColor,
    primaryColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);
const bgGradient = LinearGradient(
  colors: [
    Color.fromRGBO(204, 204, 204, 0.4745098039215686),
    Color.fromRGBO(252, 252, 252, 0.49411764705882355),
    Colors.white,
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.center,
);

final themeGradient = LinearGradient(
  colors: [lightPurple, lightGreen],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const Color fontGrey = Color.fromRGBO(166, 167, 176, 1);
const Color lightfontGrey = Color.fromRGBO(203, 202, 202, 1.0);

const Color borderGrey = Color.fromRGBO(232, 231, 231, 1.0);

const Color lightOrange = Color.fromRGBO(255, 226, 229, 1);
const Color lightYellow = Color.fromRGBO(255, 244, 222, 1);
const Color lightGreen = Color.fromRGBO(220, 252, 231, 1);
const Color lightPurple = Color.fromRGBO(243, 232, 255, 1);

const unselectedPieChartGradient = [
  Color.fromRGBO(192, 205, 217, 0.615686274509804),
  Color.fromRGBO(197, 202, 218, 0.615686274509804),
];
