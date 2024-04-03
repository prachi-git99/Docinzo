import 'package:doctor/consts/consts.dart';

import '../components/responsive_text.dart';

Widget customBottomGreetSection(context) {
  var size = MediaQuery.of(context).size;

  return Container(
    alignment: Alignment.center,
    child: Column(
      children: [
        // SizedBox(height: size.height * 0.1),
        responsiveText(
            context: context,
            text: "Live",
            textColor: fontGrey.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            size: 26.0),
        responsiveText(
            context: context,
            text: "Healthy",
            textColor: fontGrey.withOpacity(0.5),
            fontWeight: FontWeight.bold,
            size: 26.0),
        SizedBox(height: size.height * 0.03),
        responsiveText(
            context: context,
            text: "Crafted with ❤️ in india",
            textColor: lightfontGrey,
            fontWeight: FontWeight.w400,
            size: 16.0),
        responsiveText(
            context: context,
            text: "version 1.0.0",
            textColor: lightfontGrey,
            fontWeight: FontWeight.w200,
            size: 12.0),
        SizedBox(height: size.height * 0.03),
      ],
    ),
  );
}
