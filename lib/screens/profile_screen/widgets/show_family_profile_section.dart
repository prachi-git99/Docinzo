import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/profile_screen/widgets/show_add_member_container.dart';
import 'package:doctor/screens/profile_screen/widgets/show_family_member_container.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';
import '../../../controllers/family_controller.dart';

Widget showFamilyProfileSection(context) {
  FamilyController familyController = Get.find<FamilyController>();

  var size = MediaQuery.of(context).size;

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
              Obx(
                () => Container(
                  child: Wrap(
                    children: List.generate(
                        familyController.myFamily.length + 1,
                        (index) => index == (familyController.myFamily.length)
                            ? showAddMemberContainer(context)
                            // : index == 0
                            //     ? SizedBox.shrink()
                            : showFamilyMemberContainer(context, index)),
                  ),
                ),
              ),
            ],
          )),
    ],
  );
}
