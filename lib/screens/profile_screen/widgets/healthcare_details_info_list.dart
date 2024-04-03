import 'package:doctor/consts/consts.dart';

import '../../../components/responsive_text.dart';

Widget showHealthcareDetailInfoList(context, title, value) {
  var size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    margin: EdgeInsets.symmetric(vertical: containerVerMargin / 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: size.width / 3,
          child: responsiveText(
              context: context,
              text: "$title",
              textColor: black,
              fontWeight: FontWeight.w400,
              size: 14.0),
        ),
        Container(
          width: size.width / 2.2,
          child: responsiveText(
              context: context,
              text: "$value",
              textColor: primaryColor,
              fontWeight: FontWeight.w400,
              size: 14.0),
        ),
      ],
    ),
  );
}
