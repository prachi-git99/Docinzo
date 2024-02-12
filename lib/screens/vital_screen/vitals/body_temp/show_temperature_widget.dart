import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "package:pie_chart/pie_chart.dart";
import "../../../../common_widgets/show_single_line_linear_graph.dart";
import "../../../../components/responsive_text.dart";

Map<String,dynamic> WEEKLY_DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 160.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "M": {"value": 70.0},
    "T": {"value": 80.0},
    "W": {"value": 85.0},
    "Th": {"value": 60.0},
    "F": {"value": 70.0},
    "Sa": {"value": 85.0},
    "Su": {"value": 80.0},
  }
};

Map<String,dynamic> MONTHLY_DATA = {
  "x_axis": ['Jan', 'Mar', 'May', 'July', 'Sept', 'Nov'],
  "y_axis_max": 160.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "Jan": {"value": 70.0},
    "Mar": {"value": 75.0},
    "May": {"value": 80.0},
    "July": {"value": 82.7},
    "Sept": {"value": 70.0},
    "Nov": {"value": 76.0},
  }
};

Map<String,dynamic> YEARLY_DATA = {
  "x_axis": ['2021', '2022', '2023', '2024'],
  "y_axis_max": 160.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "2021": {"value": 76.0},
    "2022": {"value": 86.0},
    "2023": {"value": 96.0},
    "2024": {"value": 106.0}
  }
};

VitalsController controller = Get.find<VitalsController>();

Widget showTemperatureWidget(context,index){

  showWeeklyGraph() {
    controller.weekTitles = WEEKLY_DATA['x_axis'];

    List<BarChartGroupData> showingBarGroupsWeekly = [];
    for (int index = 0; index <  WEEKLY_DATA['x_axis'].length ; index++)
    {
      showingBarGroupsWeekly.add(
          makeGroupData(
            index,
            WEEKLY_DATA['data'][WEEKLY_DATA["x_axis"][index]]['value'],
          )
      );
    }

    return showSingleLinesLinearGraph(context, showingBarGroupsWeekly,
        WEEKLY_DATA['y_axis_max'],WEEKLY_DATA['y_axis_min'], WEEKLY_DATA['y_axis_interval']);
  }

  showMonthlyGraph() {
    controller.monthTitles = MONTHLY_DATA['x_axis'];

    List<BarChartGroupData> showingBarGroupsMonthly = [];
    for (int index = 0; index <  MONTHLY_DATA['x_axis'].length ; index++)
    {
      showingBarGroupsMonthly.add(
          makeGroupData(
            index,
            MONTHLY_DATA['data'][MONTHLY_DATA["x_axis"][index]]['value'],
          )
      );
    }
    return showSingleLinesLinearGraph(
        context, showingBarGroupsMonthly, MONTHLY_DATA['y_axis_max'],MONTHLY_DATA['y_axis_min'], MONTHLY_DATA['y_axis_interval']);
  }

  showYearlyGraph(){
    controller.yearTitles = YEARLY_DATA['x_axis'];
    List<BarChartGroupData> showingBarGroupsYearly = [];
    for (int index = 0; index <  YEARLY_DATA['x_axis'].length ; index++)
    {
      showingBarGroupsYearly.add(
          makeGroupData(
            index,
            YEARLY_DATA['data'][YEARLY_DATA["x_axis"][index]]['value'],
          )
      );
    }
    return showSingleLinesLinearGraph(
        context, showingBarGroupsYearly,  YEARLY_DATA['y_axis_max'],  YEARLY_DATA['y_axis_min'], YEARLY_DATA['y_axis_interval']);
  }

  Map GRAPH_MAP = {
    "WEEKLY" :  showWeeklyGraph(),
    "MONTHLY" : showMonthlyGraph(),
    "YEARLY" : showYearlyGraph(),
  };



  return Obx(() =>GRAPH_MAP[controller.dropDownValue[index]]);
}