import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "../../../../common_widgets/show_arealine_graph.dart";
import "../../../../common_widgets/show_twoLines_linear_graph.dart";

Map<String, dynamic> WEEKLY_DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 102.0,
  "y_axis_min": 88.0,
  "y_axis_interval": 2.0,
  "data": {
    "M": {"value": 90.0},
    "T": {"value": 92.0},
    "W": {"value": 94.0},
    "Th": {"value": 98.0},
    "F": {"value": 99.0},
    "Sa": {"value": 94.0},
    "Su": {"value": 96.0},
  }
};

Map<String, dynamic> MONTHLY_DATA = {
  "x_axis": ['Jan', 'Mar', 'May', 'Jul', 'Sept', 'Nov'],
  "y_axis_max": 110.0,
  "y_axis_min": 80.0,
  "y_axis_interval": 5.0,
  "data": {
    "Jan": {"value": 90.0},
    "Mar": {"value": 92.0},
    "May": {"value": 94.0},
    "Jul": {"value": 98.0},
    "Sept": {"value": 95.0},
    "Nov": {"value": 92.0},
  }
};

Map<String, dynamic> YEARLY_DATA = {
  "x_axis": ['2021', '2022', '2023', '2024'],
  "y_axis_max": 110.0,
  "y_axis_min": 80.0,
  "y_axis_interval": 5.0,
  "data": {
    "2021": {"value": 90.0},
    "2022": {"value": 92.0},
    "2023": {"value": 90.0},
    "2024": {"value": 94.0},
  }
};

VitalsController controller = Get.find<VitalsController>();

Widget showOxygenWidget(context,index){

  bool showArea=false;

  showWeeklyGraph() {

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

  showMonthlyGraph() {
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

  showYearlyGraph() {
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

  Map GRAPH_MAP = {
    "WEEKLY" :  showWeeklyGraph(),
    "MONTHLY" : showMonthlyGraph(),
    "YEARLY" : showYearlyGraph(),
  };

  return Obx(() =>GRAPH_MAP[controller.dropDownValue[index]]);
}