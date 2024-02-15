import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/vital_screen/vitals/height/show_height_widget.dart';
import 'package:doctor/screens/vital_screen/vitals/pulse_rate/show_pulse_widget.dart';
import 'package:doctor/screens/vital_screen/vitals/sugar_level/show_sugar_level_widget.dart';
import 'package:doctor/screens/vital_screen/vitals/weight/show_weight_widget.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';
import '../vitals/blood_pressure/show_blood_pressure_widget.dart';
import '../vitals/body_temp/show_temperature_widget.dart';
import '../vitals/oxygen/show_oxygen_widget.dart';
import 'show_vitalvalues_and_dropdown.dart';

Widget showVitalsLessInfo(context, index) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(bottom: 2 * containerVerMargin),
    padding: EdgeInsets.symmetric(horizontal: containerHorPadd),
    child: roundedCornerContainer(
      width: size.width,
      color: glassWhite,
      borderRadius: smallBorderRadius,
      blur: 12.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: containerHorPadd, vertical: containerVerPadd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showVitalvaluesDropdown(context, index),
            SizedBox(height: 2 * containerVerMargin),
            index == 0
                ? showBloodPressureWidget(context, index)
                : index == 1
                    ? showWeightWidget(context, index)
                    : index == 2
                        ? showPulseWidget(context, index)
                        : index == 3
                            ? showSugarLevelWidget(context, index)
                            : index == 4
                                ? showTemperatureWidget(context, index)
                                : index == 5
                                    ? showOxygenWidget(context, index)
                                    : index == 6
                                        ? showHeightWidget(context, index)
                                        : SizedBox.shrink(),
            GestureDetector(
              onTap: () {},
              child: responsiveText(
                  context: context,
                  textColor: primaryColor,
                  text: "View Details",
                  fontWeight: FontWeight.w500,
                  size: 14.0),
            ),
          ],
        ),
      ),
    ),
  );
}
