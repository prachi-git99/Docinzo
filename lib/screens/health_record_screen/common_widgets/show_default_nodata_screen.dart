import 'package:doctor/consts/consts.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/responsive_text.dart';

Widget showDefaultScreen(context, tag) {
  var size = MediaQuery.of(context).size;

  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/images/$noReportsFoundImg",
            fit: BoxFit.contain, width: size.width, height: size.height * 0.3),
        responsiveText(
            context: context,
            textColor: secondaryColor,
            text: "$tag",
            fontWeight: FontWeight.w400,
            size: 20.0)
      ],
    ),
  );
}
