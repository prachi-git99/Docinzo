import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/health_history_controller.dart';
import '../widgets/show_optionChips.dart';

Widget showSmokeForm(context) {
  HealthHistoryController controller = Get.find<HealthHistoryController>();

  return Column(
    children: [
      SizedBox(height: appVerticalMargin),
      responsiveText(
          context: context,
          text: "Do you smoke?",
          textColor: black,
          fontWeight: FontWeight.w500,
          size: 22.0),
      SizedBox(height: appVerticalMargin),
      showOptionList(
          context, controller.smokeList, controller.smokeListChips, controller),
      customButtonWidget(context, "Add Health History", white, 14.0, () {
        Navigator.pushNamedAndRemoveUntil(context, "home", (route) => false);
        controller.index.value = 0;
      })
    ],
  );
}
