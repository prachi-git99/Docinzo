import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";

import "../../../../common_widgets/show_arealine_graph.dart";
import "../../widgets/show_vitalvalues_and_dropdown.dart";

Map<String, dynamic> DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 120.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "M": {"value": 60.0},
    "T": {"value": 55.0},
    "W": {"value": 60.0},
    "Th": {"value": 60.0},
    "F": {"value": 55.0},
    "Sa": {"value": 50.0},
    "Su": {"value": 60.0},
  }
};

VitalsController controller = Get.find<VitalsController>();

Widget showWeightWidget(context, index) {
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

  return Column(
    children: [
      showVitalvaluesDropdown(context, index),
      SizedBox(height: 2 * containerVerMargin),
      Obx(() => showGraph(controller.dropDownValue[index])),
    ],
  );
}
