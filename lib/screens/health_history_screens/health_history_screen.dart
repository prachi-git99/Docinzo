import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/health_history_controller.dart';
import 'package:get/get.dart';

import '../../components/responsive_text.dart';
import 'forms/show_Allergy_form.dart';
import 'forms/show_alcohol_form.dart';
import 'forms/show_diet_form.dart';
import 'forms/show_eyesight_form.dart';
import 'forms/show_family_history_form.dart';
import 'forms/show_smoke_form.dart';

class HealthHistory extends StatelessWidget {
  HealthHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HealthHistoryController healthHistoryController =
        Get.put(HealthHistoryController());

    Map<int, dynamic> HEALTH_FORM_MAP = {
      0: showAllergyForm(context),
      1: showFamilyHistoryForm(context),
      2: showDietForm(context),
      3: showAlcoholForm(context),
      4: showEyeSightForm(context),
      5: showSmokeForm(context),
    };

    print(healthHistoryController.index.value);
    // var index = 0;
    return gradientBg(
        context: context,
        widget: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: customAppbar(context, "Add Your Health History"),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: primaryColor,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                        ),
                        onPressed: () {
                          if (healthHistoryController.index.value > 0)
                            healthHistoryController.index.value =
                                healthHistoryController.index.value - 1;
                        },
                      ),
                      Obx(
                        () => responsiveText(
                            context: context,
                            text:
                                "${healthHistoryController.index.value + 1} / ${HEALTH_FORM_MAP.length}",
                            textColor: darkfontGrey,
                            fontWeight: FontWeight.w500,
                            size: 14.0),
                      ),
                      IconButton(
                        color: primaryColor,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                        onPressed: () {
                          if (healthHistoryController.index.value <
                              HEALTH_FORM_MAP.length - 1)
                            healthHistoryController.index.value =
                                healthHistoryController.index.value + 1;
                        },
                      ),
                    ],
                  ),
                  Obx(() =>
                      HEALTH_FORM_MAP[healthHistoryController.index.value])
                ],
              ),
            )));
  }
}
