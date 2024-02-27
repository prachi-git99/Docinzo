import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/health_history_controller.dart';
import 'package:doctor/screens/health_history_screens/widgets/show_choicechips.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';

Widget showAllergyForm(context) {
  HealthHistoryController controller = Get.find<HealthHistoryController>();

  return Column(
    children: [
      SizedBox(height: appVerticalMargin),
      responsiveText(
          context: context,
          text: "Do you have any of these allergies ?",
          textColor: black,
          fontWeight: FontWeight.w500,
          size: 22.0),
      SizedBox(height: appVerticalMargin),
      showChipList(context, controller.allergyList, controller.allergyListChips,
          controller),
      SizedBox(height: appVerticalMargin),
      customButtonWidget(context, "Next", white, 14.0, () {
        controller.index.value = 1;
      })
    ],
  );
}
