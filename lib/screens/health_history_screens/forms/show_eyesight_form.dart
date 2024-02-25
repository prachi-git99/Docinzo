import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/common_widgets/custom_textfield_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:get/get.dart';

import '../../../components/responsive_text.dart';
import '../../../controllers/health_history_controller.dart';
import '../widgets/show_choicechips.dart';

Widget showEyeSightForm(context) {
  HealthHistoryController controller = Get.find<HealthHistoryController>();

  var size = MediaQuery.of(context).size;

  TextEditingController leftSphController = TextEditingController();
  TextEditingController rightSphController = TextEditingController();

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
      showChipList(context, controller.eyeSightList,
          controller.eyeSightListChips, controller),
      SizedBox(height: appVerticalMargin),
      Divider(),
      Row(
        children: [
          Expanded(
            child: customTextField(
                title: "Left",
                hintText: "Sph number",
                context: context,
                keytype: TextInputType.number,
                controller: leftSphController),
          ),
          SizedBox(width: containerHorMargin),
          Expanded(
            child: customTextField(
                title: "Right",
                hintText: "Sph number",
                context: context,
                keytype: TextInputType.number,
                controller: rightSphController),
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
                controller: leftSphController),
          ),
          SizedBox(width: containerHorMargin),
          Expanded(
            child: customTextField(
                title: "Right",
                hintText: "Cyl number",
                context: context,
                keytype: TextInputType.number,
                controller: rightSphController),
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
                controller: leftSphController),
          ),
          SizedBox(width: containerHorMargin),
          Expanded(
            child: customTextField(
                title: "Right",
                hintText: "Axis number",
                context: context,
                keytype: TextInputType.number,
                controller: rightSphController),
          ),
        ],
      ),
      SizedBox(height: appVerticalMargin),
      customButtonWidget(context, "Next", white, 14.0, () {
        controller.index.value = 5;
      })
    ],
  );
}
