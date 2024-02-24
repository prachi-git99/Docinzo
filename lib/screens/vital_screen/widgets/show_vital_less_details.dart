import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/vital_screen/vitals/height/show_height_widget.dart';
import 'package:doctor/screens/vital_screen/vitals/pulse_rate/show_pulse_widget.dart';
import 'package:doctor/screens/vital_screen/vitals/sugar_level/show_sugar_level_widget.dart';
import 'package:doctor/screens/vital_screen/vitals/weight/show_weight_widget.dart';

import '../../../components/rounded_corner_container.dart';
import '../vitals/blood_pressure/show_blood_pressure_widget.dart';
import '../vitals/body_temp/show_temperature_widget.dart';
import '../vitals/menstrual/show_menstrual_widget.dart';
import '../vitals/oxygen/show_oxygen_widget.dart';

Widget showVitalsLessInfo(context, index) {
  var size = MediaQuery.of(context).size;

  Map<int, dynamic> VITAL_MAP = {
    0: showBloodPressureWidget(context, index),
    1: showWeightWidget(context, index),
    2: showPulseWidget(context, index),
    3: showSugarLevelWidget(context, index),
    4: showTemperatureWidget(context, index),
    5: showOxygenWidget(context, index),
    6: showHeightWidget(context, index),
    7: showMenstrualWidget(context, index)
  };
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
        child: (index >= 0 && index <= VITAL_MAP.length - 1)
            ? VITAL_MAP[index]
            : SizedBox.shrink(),
      ),
    ),
  );
}
