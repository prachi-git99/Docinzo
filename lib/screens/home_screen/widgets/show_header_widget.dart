import "package:doctor/consts/consts.dart";
import "package:doctor/screens/profile_screen/profile_screen.dart";
import "package:flutter_svg/svg.dart";
import 'package:get/get.dart';

import "../../../components/gradient_rounded_container.dart";
import "../../../components/responsive_text.dart";
import "../../../firebase/add_profile_data_controller.dart";

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
                  fontWeight: FontWeight.w500,
                  size: 16.0),
              responsiveText(
                  context: context,
                  text: "Welcome to Docinzo",
                  textColor: black,
                  fontWeight: FontWeight.w600,
                  size: 18.0),
              responsiveText(
                  context: context,
                  text: greetUser,
                  textColor: black,
                  fontWeight: FontWeight.w500,
                  size: 16.0),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            AddProfileData addProfileData = Get.put(AddProfileData());
            addProfileData.fetchUserData();
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
