import 'package:doctor/consts/consts.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../../components/gradient_rounded_container.dart';
import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';

Widget showFamilyProfileSection(context) {
  var size = MediaQuery.of(context).size;
  int familyCount = 3;
  return Column(
    children: [
      roundedCornerContainer(
          width: size.width,
          borderRadius: smallBorderRadius,
          color: glassWhite,
          blur: 12.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //titles
              responsiveText(
                  context: context,
                  text: 'Your Family',
                  textColor: black,
                  fontWeight: FontWeight.w500,
                  size: 16.0),
              //users
              Wrap(
                children: List.generate(
                    familyCount,
                    (index) => index == familyCount - 1
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                vertical: containerVerMargin,
                                horizontal: containerHorMargin / 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: size.width * 0.08,
                                  child: gradientRoundedContainer(
                                    width: size.width * 0.13,
                                    height: size.width * 0.13,
                                    context: context,
                                    borderRadius: largeBorderRadius,
                                    child: Icon(
                                      Icons.add,
                                      color: white,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(left: 5.0),
                                  width: size.width * 0.22,
                                  child: responsiveText(
                                      context: context,
                                      text: "Add Family",
                                      textColor: black,
                                      fontWeight: FontWeight.w400,
                                      size: 12.0),
                                )
                              ],
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.symmetric(
                                vertical: containerVerMargin,
                                horizontal: containerHorMargin / 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: size.width * 0.08,
                                  child: Container(
                                    width: size.width * 0.1,
                                    height: size.width * 0.1,
                                    child: RandomAvatar(
                                      DateTime.now().toIso8601String(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: size.width * 0.22,
                                  child: responsiveText(
                                      context: context,
                                      text: "prachi",
                                      textColor: black,
                                      fontWeight: FontWeight.w400,
                                      size: 14.0),
                                )
                              ],
                            ),
                          )),
              ),
            ],
          )),
    ],
  );
}
