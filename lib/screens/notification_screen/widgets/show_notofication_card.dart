import 'package:doctor/consts/consts.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';

Widget showNotificationCard(context) {
  var size = MediaQuery.of(context).size;

  return Column(
      children: List.generate(
          1,
          (index) => Column(
                children: [
                  SizedBox(height: containerVerMargin),
                  roundedCornerContainer(
                    color: glassWhite,
                    width: size.width,
                    spread: 4.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        responsiveText(
                            context: context,
                            textColor: black,
                            text: "Your Reports are ready !!",
                            fontWeight: FontWeight.w500,
                            size: 18.0),
                        Row(
                          children: [
                            responsiveText(
                                context: context,
                                textColor: fontGrey,
                                text: "12 Feb,2024  ",
                                fontWeight: FontWeight.w500,
                                size: 12.0),
                            responsiveText(
                                context: context,
                                textColor: fontGrey,
                                text: "10:20 AM  ",
                                fontWeight: FontWeight.w500,
                                size: 12.0),
                          ],
                        ),
                        SizedBox(height: containerVerMargin / 2),
                        responsiveText(
                            context: context,
                            textColor: black,
                            text:
                                "Your Family Member Prachi's reports are ready. Please download reports\nName: X-ray report\nHave a great day, LIVE HEALTHY..",
                            fontWeight: FontWeight.w400,
                            size: 12.0)
                      ],
                    ),
                    borderRadius: smallBorderRadius,
                    blur: 14.0,
                  ),
                ],
              )));
}
