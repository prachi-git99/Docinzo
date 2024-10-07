import 'package:doctor/screens/profile_screen/widgets/show_health_history_section.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../components/gradient_rounded_container.dart';
import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';
import '../../../consts/consts.dart';
import '../../../firebase/add_profile_data_controller.dart';
import 'edit_profile_dialog.dart';

Widget showUserProfileSection(context) {
  var size = MediaQuery.of(context).size;
  AddProfileData addProfileData = Get.put(AddProfileData());

  return Container(
    margin: EdgeInsets.symmetric(vertical: containerVerMargin),
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: containerVerMargin),
          child: Stack(
            children: [
              // User profile container
              roundedCornerContainer(
                width: size.width,
                borderRadius: smallBorderRadius,
                color: glassWhite,
                blur: 12.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User photo
                    CircleAvatar(
                      radius: size.width * 0.10,
                      child: gradientRoundedContainer(
                        width: size.width * 0.15,
                        height: size.width * 0.15,
                        context: context,
                        borderRadius: largeBorderRadius,
                        child: SvgPicture.asset("assets/images/icons/$user",
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(width: containerHorMargin),
                    // User info
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => responsiveText(
                              context: context,
                              text: addProfileData.name.value.isEmpty
                                  ? 'User'
                                  : addProfileData.name.value,
                              textColor: black,
                              fontWeight: FontWeight.w500,
                              size: 18.0,
                            )),
                        Obx(() => responsiveText(
                              context: context,
                              text: "UHID: ${addProfileData.uhid.value}",
                              textColor: black,
                              fontWeight: FontWeight.normal,
                              size: 12.0,
                            )),
                        Obx(() => responsiveText(
                              context: context,
                              text: "Email: ${addProfileData.email.value}",
                              textColor: black,
                              fontWeight: FontWeight.normal,
                              size: 12.0,
                            )),
                        responsiveText(
                          context: context,
                          text: "Phone: ${currentUser?.phoneNumber}",
                          textColor: black,
                          fontWeight: FontWeight.normal,
                          size: 12.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Edit icon positioned at the top right
              Positioned(
                right: 10,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext dialogContext) {
                        return editProfileDialog(context, addProfileData);
                      },
                    );
                  },
                  child: Icon(Icons.edit, color: black),
                ),
              ),
            ],
          ),
        ),
        // User health history
        showHealthHistorySection(context),
      ],
    ),
  );
}
