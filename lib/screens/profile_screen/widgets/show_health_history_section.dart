import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/profile_screen/widgets/healthcare_details_info_list.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';
import '../../../controllers/health_history_controller.dart';

Widget showHealthHistorySection(context) {
  HealthHistoryController controller = Get.put(HealthHistoryController());
  var size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.symmetric(vertical: containerVerMargin),
    child: roundedCornerContainer(
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
                text: 'Healthcare Information',
                textColor: black,
                fontWeight: FontWeight.w500,
                size: 16.0),

            showHealthcareDetailInfoList(
                context, "Allergies", "Milk, Coconut, Dust"),
            showHealthcareDetailInfoList(context, "Conditions your family have",
                "Thyroid, Blood pressure, Diabetes"),
            showHealthcareDetailInfoList(context, "Diet type", "Vegetarian"),
            showHealthcareDetailInfoList(
                context, "Do you consume alcohol ?", "Yes, Occasionally"),
            showHealthcareDetailInfoList(context, "Do you smoke ?", "Never"),
            showHealthcareDetailInfoList(context, "Eye power", "None"),

            // Obx(
            //       () => Container(
            //     child: Wrap(
            //       children: List.generate(
            //           familyController.myFamily.length + 1,
            //               (index) => index == (familyController.myFamily.length)
            //               ? showAddMemberContainer(context)
            //               : showFamilyMemberContainer(context, index)),
            //     ),
            //   ),
            // ),
          ],
        )),
  );
}
