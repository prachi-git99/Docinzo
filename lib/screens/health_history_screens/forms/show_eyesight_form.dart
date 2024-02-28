import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/common_widgets/custom_textfield_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/health_history_controller.dart';
import '../widgets/show_optionChips.dart';

Widget showEyeSightForm(context) {
  HealthHistoryController controller = Get.find<HealthHistoryController>();

  var size = MediaQuery.of(context).size;

  return Column(
    children: [
      SizedBox(height: appVerticalMargin),
      responsiveText(
          context: context,
          text: "Do you have eye power?",
          textColor: black,
          fontWeight: FontWeight.w500,
          size: 22.0),
      SizedBox(height: appVerticalMargin),
      showOptionList(context, controller.eyeSightList,
          controller.eyeChipSelected, controller),
      Obx(() => controller.eyeChipSelected.value == 1
          ? Column(
              children: [
                SizedBox(height: 3 * appVerticalMargin),
                Row(
                  children: [
                    Expanded(
                      child: customTextField(
                          title: "Left",
                          hintText: "Sph number",
                          context: context,
                          keytype: TextInputType.number,
                          controller: controller.leftSphController),
                    ),
                    SizedBox(width: containerHorMargin),
                    Expanded(
                      child: customTextField(
                          title: "Right",
                          hintText: "Sph number",
                          context: context,
                          keytype: TextInputType.number,
                          controller: controller.rightSphController),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: customTextField(
                          title: "Left",
                          hintText: "Cyl number",
                          context: context,
                          keytype: TextInputType.number,
                          controller: controller.leftCylController),
                    ),
                    SizedBox(width: containerHorMargin),
                    Expanded(
                      child: customTextField(
                          title: "Right",
                          hintText: "Cyl number",
                          context: context,
                          keytype: TextInputType.number,
                          controller: controller.rightCylController),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: customTextField(
                          title: "Left",
                          hintText: "Axis number",
                          context: context,
                          keytype: TextInputType.number,
                          controller: controller.leftAxisController),
                    ),
                    SizedBox(width: containerHorMargin),
                    Expanded(
                      child: customTextField(
                          title: "Right",
                          hintText: "Axis number",
                          context: context,
                          keytype: TextInputType.number,
                          controller: controller.rightAxisController),
                    ),
                  ],
                ),
              ],
            )
          : SizedBox.shrink()),
      SizedBox(height: appVerticalMargin),
      customButtonWidget(context, "Next", white, 14.0, () {
        controller.index.value = 5;
      })
    ],
  );
}
