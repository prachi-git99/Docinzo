import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/health_history_controller.dart';
import '../widgets/show_optionChips.dart';

Widget showDietForm(context) {
  HealthHistoryController controller = Get.find<HealthHistoryController>();

  return Column(
    children: [
      SizedBox(height: appVerticalMargin),
      responsiveText(
          context: context,
          text: "Your diet type ?",
          textColor: black,
          fontWeight: FontWeight.w500,
          size: 22.0),
      SizedBox(height: appVerticalMargin),
      showOptionList(context, controller.dietList, controller.dietChipSelected,
          controller),
      SizedBox(height: appVerticalMargin),
      customButtonWidget(context, "Next", white, 14.0, () {
        controller.index.value = 3;
      }),
    ],
  );
}
