import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/profile_screen/widgets/show_health_history_section.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/gradient_rounded_container.dart';
import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';

Widget showUserProfileSection(context) {
  var size = MediaQuery.of(context).size;

  return Container(
    margin: EdgeInsets.symmetric(vertical: containerVerMargin),
    child: Column(
      children: [
        roundedCornerContainer(
            width: size.width,
            borderRadius: smallBorderRadius,
            color: glassWhite,
            blur: 12.0,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //user photo
                CircleAvatar(
                  radius: size.width * 0.12,
                  child: gradientRoundedContainer(
                      width: size.width * 0.2,
                      height: size.width * 0.2,
                      context: context,
                      borderRadius: largeBorderRadius,
                      child: SvgPicture.asset("assets/images/icons/$user",
                          color: Colors.white)),
                ),
                SizedBox(width: containerHorMargin),
                //user info
                Container(
                  width: size.width * 0.48,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      responsiveText(
                          context: context,
                          text: '${currentUser?.displayName}',
                          textColor: black,
                          fontWeight: FontWeight.w500,
                          size: 18.0),
                      responsiveText(
                          context: context,
                          text: "UHID: $userUHID",
                          textColor: black,
                          fontWeight: FontWeight.normal,
                          size: 12.0),
                      responsiveText(
                          context: context,
                          text: "Phone: ${currentUser?.phoneNumber}",
                          textColor: black,
                          fontWeight: FontWeight.normal,
                          size: 12.0),
                      responsiveText(
                          context: context,
                          text: "Blood grp: $userBloodGrp",
                          textColor: black,
                          fontWeight: FontWeight.normal,
                          size: 12.0),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {}, child: Icon(Icons.edit, color: black)),
              ],
            )),
        //user health history
        showHealthHistorySection(context),
      ],
    ),
  );
}
