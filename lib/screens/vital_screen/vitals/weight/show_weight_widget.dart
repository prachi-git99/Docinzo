import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "../../../../common_widgets/show_arealine_graph.dart";
import "../../../../common_widgets/show_twoLines_linear_graph.dart";

Map<String, dynamic> WEEKLY_DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 120.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "M": {"value": 50.0},
    "T": {"value": 55.0},
    "W": {"value": 58.0},
    "Th": {"value": 53.0},
    "F": {"value": 55.0},
    "Sa": {"value": 50.0},
    "Su": {"value": 55.0},
  }
};

Map<String, dynamic> MONTHLY_DATA = {
  "x_axis": ['Jan', 'Mar', 'May', 'Jul', 'Sept', 'Nov'],
  "y_axis_max": 120.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "Jan": {"value": 50.0},
    "Mar": {"value": 52.0},
    "May": {"value": 54.0},
    "Jul": {"value": 58.0},
    "Sept": {"value": 55.0},
    "Nov": {"value": 52.0},
  }
};

Map<String, dynamic> YEARLY_DATA = {
  "x_axis": ['2021', '2022', '2023', '2024'],
  "y_axis_max": 120.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "2021": {"value": 50.0},
    "2022": {"value": 52.0},
    "2023": {"value": 50.0},
    "2024": {"value": 54.0},
  }
};

VitalsController controller = Get.find<VitalsController>();

Widget showWeightWidget(context, index) {
  bool showArea = false;

  showWeeklyWeightGraph() {

    controller.weekTitles = WEEKLY_DATA['x_axis'];

    List<FlSpot> points = [];
    for (int index =  0; index < WEEKLY_DATA['x_axis'].length; index++) {
      points.add(FlSpot(
        index.toDouble(),
        WEEKLY_DATA['data'][WEEKLY_DATA["x_axis"][index]]['value'],
      ));
    }


    return showAreaLineGraph(
      context: context,
        showDots: true,
        lineWidth: 0.0,
        pointsList: points,
        showArea: showArea,
        interval: WEEKLY_DATA['y_axis_interval'],
        minY: WEEKLY_DATA['y_axis_min'],
        maxY: WEEKLY_DATA['y_axis_max'],
        // maxX: double.parse("${WEEKLY_DATA['x_axis'].length}"),
    );
  }

  showMonthlyWeightGraph() {
    controller.monthTitles = MONTHLY_DATA['x_axis'];

    List<FlSpot> points = [];
    for (int index = 0; index < MONTHLY_DATA['x_axis'].length; index++) {
      points.add(FlSpot(
        index.toDouble(),
        MONTHLY_DATA['data'][MONTHLY_DATA["x_axis"][index]]['value'],
      ));
    }

    return showAreaLineGraph(
      context: context,
      showDots: true,
      lineWidth: 0.0,
      pointsList: points,
      showArea: showArea,
      interval: MONTHLY_DATA['y_axis_interval'],
      minY: MONTHLY_DATA['y_axis_min'],
      maxY: MONTHLY_DATA['y_axis_max'],
    );
  }

  showYearlyWeightGraph() {
    controller.yearTitles = YEARLY_DATA['x_axis'];

    List<FlSpot> points = [];
    for (int index = 0; index < YEARLY_DATA['x_axis'].length; index++) {
      points.add(FlSpot(
        index.toDouble(),
        YEARLY_DATA['data'][YEARLY_DATA["x_axis"][index]]['value'],
      ));
    }

    return showAreaLineGraph(
      context: context,
      showDots: true,
      lineWidth: 0.0,
      pointsList: points,
      showArea: showArea,
      interval: YEARLY_DATA['y_axis_interval'],
      minY: YEARLY_DATA['y_axis_min'],
      maxY: YEARLY_DATA['y_axis_max'],
    );
  }

  Map WEIGHT_GRAPH_MAP = {
    "WEEKLY": showWeeklyWeightGraph(),
    "MONTHLY": showMonthlyWeightGraph(),
    "YEARLY": showYearlyWeightGraph(),
  };

  return Obx(() => WEIGHT_GRAPH_MAP[controller.dropDownValue[index]]);
}
