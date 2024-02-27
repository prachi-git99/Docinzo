import 'package:doctor/consts/consts.dart';

import '../../../common_widgets/custom_botton_widget.dart';
import '../../../components/dynamic_gradient_rounded_container.dart';
import '../../../components/responsive_text.dart';
import '../../health_history_screens/health_history_screen.dart';

Widget showHealtyHistorySection(context) {
  var size = MediaQuery.of(context).size;
  return Column(
    children: [
      SizedBox(height: containerVerMargin),

      //show general health form
      dynamicGradientRoundedContainer(
          context: context,
          gradient: themeGradient,
          borderRadius: smallBorderRadius,
          width: size.width,
          blur: 12.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsiveText(
                    context: context,
                    text: healthHistory,
                    textColor: primaryColor,
                    fontWeight: FontWeight.w600,
                    size: 18.0),
                responsiveText(
                    context: context,
                    text: healthHistoryDesc,
                    textColor: darkfontGrey,
                    fontWeight: FontWeight.w400,
                    size: 14.0),
                Center(child: Image.asset("assets/images/$healthHistoryImg")),
                customButtonWidget(context, "Add +", white, 16.0, () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HealthHistory()));
                })
              ],
            ),
          )),
      SizedBox(height: 10 * containerVerMargin)
    ],
  );
}
