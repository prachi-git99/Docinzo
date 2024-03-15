import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';

class VitalsController extends GetxController {
  var myVitalData = [
    {
      "name": "Blood Pressure",
      "image": icBp,
      "value": null,
      "unit": "mmHg",
      "date": "No data"
    },
    {
      "name": "Weight",
      "image": icweight,
      "value": null,
      "unit": "Kg",
      "date": "No data"
    },
    {
      "name": "Pulse Rate",
      "image": icpulse,
      "value": null,
      "unit": "bpm",
      "date": "No data"
    },
    {
      "name": "Blood Sugar Level",
      "image": icsugar,
      "value": null,
      "unit": "mg/dL",
      "date": "No data"
    },
    {
      "name": "Body Temperature",
      "image": ictemp,
      "value": null,
      "unit": "F",
      "date": "No data"
    },
    {
      "name": "Oxygen Saturation",
      "image": icoxygen,
      "value": null,
      "unit": "SpO",
      "date": "No data"
    },
    {
      "name": "Height",
      "image": icheight,
      "value": null,
      "unit": "cm",
      "date": "No data"
    },
    {
      "name": "Menstrual Cycle",
      "image": icperiod,
      "value": null,
      "unit": "days",
      "date": "No data"
    }
  ];
  List<bool> showVitalInfo = List.generate(8, (index) => false);
  var dropDownValue = List.generate(8, (index) => "WEEKLY").obs;

  final dropDownList =
      List.generate(8, (index) => ["WEEKLY", "MONTHLY", "YEARLY"]);

  List<String> bottomTitleList = [];

  var style = const TextStyle(
      color: black,
      fontWeight: FontWeight.w400,
      fontFamily: poppins,
      fontSize: 14.0);

  Widget leftTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: containerHorPadd,
        child: Text("${value.toInt()}", style: style));
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final Widget text = Text(bottomTitleList[value.toInt()], style: style);

    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: containerVerPadd, //margin top
        child: text);
  }

  void setSelected(String value, index) {
    dropDownValue[index] = value;
  }
}
