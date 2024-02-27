import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";

import "../../../../common_widgets/show_arealine_graph.dart";
import "../../widgets/show_vitalvalues_and_dropdown.dart";

Map<String, dynamic> DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 270.0,
  "y_axis_min": 30.0,
  "y_axis_interval": 30.0,
  "data": {
    "M": {"value": 60.0},
    "T": {"value": 62.0},
    "W": {"value": 63.0},
    "Th": {"value": 64.0},
    "F": {"value": 65.0},
    "Sa": {"value": 67.0},
    "Su": {"value": 69.0},
  }
};

VitalsController controller = Get.find<VitalsController>();

Widget showHeightWidget(context, index) {
  bool showArea = false;
  double lineWidth = 0.0;

  showGraph(dropDownValue) {
    controller.bottomTitleList = DATA['x_axis'];
    List<FlSpot> points = [];
    for (int index = 0; index < DATA['x_axis'].length; index++) {
      if (DATA['data'][DATA["x_axis"][index]]['value'] == 0.0) {
        points.add(FlSpot(index.toDouble(), 0.0));
      } else {
        points.add(FlSpot(
            index.toDouble(), DATA['data'][DATA["x_axis"][index]]['value']));
      }
    }

    return showAreaLineGraph(
        context: context,
        showDots: true,
        lineWidth: lineWidth,
        pointsList: points,
        showArea: showArea,
        interval: DATA['y_axis_interval'],
        minY: DATA['y_axis_min'],
        maxY: DATA['y_axis_max']);
  }

  return Column(
    children: [
      showVitalvaluesDropdown(context, index),
      SizedBox(height: 2 * containerVerMargin),
      Obx(() => showGraph(controller.dropDownValue[index])),
    ],
  );
}
