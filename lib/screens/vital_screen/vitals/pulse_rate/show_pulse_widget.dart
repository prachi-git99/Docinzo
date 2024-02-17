import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";

import "../../../../common_widgets/show_arealine_graph.dart";

Map<String, dynamic> DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 120.0,
  "y_axis_min": 60.0,
  "y_axis_interval": 10.0,
  "data": {
    "M": {"value": 60.0},
    "T": {"value": 75.0},
    "W": {"value": 80.0},
    "Th": {"value": 75.0},
    "F": {"value": 82.0},
    "Sa": {"value": 67.0},
    "Su": {"value": 79.0}
  }
};

VitalsController controller = Get.find<VitalsController>();

Widget showPulseWidget(context, index) {
  bool showArea = false;

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
        lineWidth: 0.0,
        pointsList: points,
        showArea: showArea,
        interval: DATA['y_axis_interval'],
        minY: DATA['y_axis_min'],
        maxY: DATA['y_axis_max']);
  }

  return Obx(() => showGraph(controller.dropDownValue[index]));
}
