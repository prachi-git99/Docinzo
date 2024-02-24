import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/health_history_controller.dart';
import 'package:get/get.dart';

Widget showAllergyForm(context) {
  HealthHistoryController controller = Get.find<HealthHistoryController>();
  var size = MediaQuery.of(context).size;
  return Column(
    children: [
      SizedBox(height: appVerticalMargin),
      Wrap(
        children: [
          for (int i = 0; i < controller.items.length; i++)
            Obx(
              () => Container(
                margin:
                    EdgeInsets.symmetric(horizontal: containerHorMargin / 2),
                child: ChoiceChip(
                  padding: EdgeInsets.symmetric(horizontal: containerHorPadd),
                  label: Text(controller.items[i]),
                  backgroundColor: white,
                  showCheckmark: false,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: secondaryColor),
                      borderRadius: BorderRadius.circular(smallBorderRadius)),
                  elevation: 2,
                  // side: BorderSide(color: primaryBlueColor),
                  selected: controller.ChipSelected[i],
                  selectedColor: secondaryColor,
                  labelStyle: TextStyle(
                      color: controller.ChipSelected[i] == true
                          ? white
                          : primaryColor,
                      fontFamily: poppins,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                  onSelected: (bool value) {
                    controller.ChipSelected[i] = value;
                  },
                ),
              ),
            )
        ],
      ),
      SizedBox(height: appVerticalMargin),
      customButtonWidget(context, "Allergy", white, 14.0, () {})
    ],
  );
}
