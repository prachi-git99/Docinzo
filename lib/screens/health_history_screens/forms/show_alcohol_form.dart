import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/health_history_controller.dart';
import '../widgets/show_choicechips.dart';

Widget showAlcoholForm(context) {
  HealthHistoryController controller = Get.find<HealthHistoryController>();

  return Column(
    children: [
      SizedBox(height: appVerticalMargin),
      responsiveText(
          context: context,
          text: "Do you consume alcohol ?",
          textColor: black,
          fontWeight: FontWeight.w500,
          size: 22.0),
      SizedBox(height: appVerticalMargin),
      showChipList(context, controller.alcoholList, controller.alcoholListChips,
          controller),
      SizedBox(height: appVerticalMargin),
      customButtonWidget(context, "Next", white, 14.0, () {
        controller.index.value = 4;
      })
    ],
  );
}
