import "package:doctor/consts/consts.dart";
import "package:doctor/screens/profile_screen/profile_screen.dart";
import "package:flutter_svg/svg.dart";

import "../../../components/gradient_rounded_container.dart";
import "../../../components/responsive_text.dart";

Widget showHeaderWidget(context) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(bottom: containerVerMargin),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: size.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              responsiveText(
                  context: context,
                  text: greetText,
                  textColor: black,
                  fontWeight: FontWeight.w500),
              responsiveText(
                  context: context,
                  text: currentUser!.displayName ?? "User",
                  textColor: black,
                  fontWeight: FontWeight.w600,
                  size: 18.0),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
          },
          child: CircleAvatar(
            child: gradientRoundedContainer(
                context: context,
                borderRadius: smallBorderRadius,
                child: SvgPicture.asset("assets/images/icons/$user",
                    color: Colors.white)),
          ),
        ),
      ],
    ),
  );
}
