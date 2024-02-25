import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/health_history_screens/widgets/show_choicechips.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/health_history_controller.dart';

Widget showFamilyHistoryForm(context) {
  HealthHistoryController controller = Get.find<HealthHistoryController>();

  return Column(
    children: [
      SizedBox(height: appVerticalMargin),
      responsiveText(
          context: context,
          text:
              "Do you have a history of any of the following conditions in your family ?",
          textColor: black,
          fontWeight: FontWeight.w500,
          size: 22.0),
      SizedBox(height: appVerticalMargin),
      showChipList(context, controller.familyHistoryList,
          controller.familyHistoryListChips, controller),
      customButtonWidget(context, "Next", white, 14.0, () {
        controller.index.value = 2;
      })
    ],
  );
}
