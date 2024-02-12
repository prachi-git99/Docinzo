
import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "package:pie_chart/pie_chart.dart";

import "../../../../common_widgets/show_twoLines_linear_graph.dart";
import "../../../../components/responsive_text.dart";

Map<String,dynamic> WEEKLY_DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 240.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "M": {"upper": 120.0, "lower": 80.0},
    "T": {"upper": 110.0, "lower": 80.0},
    "W": {"upper": 120.0, "lower": 85.0},
    "Th": {"upper": 100.0, "lower": 60.0},
    "F": {"upper": 105.0, "lower": 70.0},
    "Sa": {"upper": 90.0, "lower": 85.0},
    "Su": {"upper": 120.0, "lower": 80.0},
  }
};

Map<String,dynamic> MONTHLY_DATA = {
  "x_axis": ['Jan', 'Mar', 'May', 'July', 'Sept', 'Nov'],
  "y_axis_max": 240.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "Jan": {"upper": 120.0, "lower": 80.0},
    "Mar": {"upper": 110.0, "lower": 70.0},
    "May": {"upper": 120.0, "lower": 60.0},
    "July": {"upper": 110.0, "lower": 85.0},
    "Sept": {"upper": 150.0, "lower": 80.0},
    "Nov": {"upper": 120.0, "lower": 90.0},
  }
};

Map<String,dynamic> YEARLY_DATA = {
  "x_axis": ['2021', '2022', '2023', '2024'],
  "y_axis_max": 240.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "2021": {"upper": 120.0, "lower": 90.0},
    "2022": {"upper": 125.0, "lower": 80.0},
    "2023": {"upper": 110.0, "lower": 70.0},
    "2024": {"upper": 90.0, "lower": 60.0}
  }
};

VitalsController controller = Get.find<VitalsController>();

Widget showBloodPressureWidget(context, index) {

  showWeeklyBPGraph() {
    controller.weekTitles = WEEKLY_DATA['x_axis'];

     List<BarChartGroupData> showingBarGroupsWeekly = [];
      for (int index = 0; index <  WEEKLY_DATA['x_axis'].length ; index++)
        {
          showingBarGroupsWeekly.add(
              makeGroupData(
                  index,
                  WEEKLY_DATA['data'][WEEKLY_DATA["x_axis"][index]]['upper'],
                  WEEKLY_DATA['data'][WEEKLY_DATA["x_axis"][index]]['lower'],
              )
          );
        }

    return showTwoLinesLinearGraph(context, showingBarGroupsWeekly,
        WEEKLY_DATA['y_axis_max'],WEEKLY_DATA['y_axis_min'], WEEKLY_DATA['y_axis_interval']);
  }

  showMonthlyBPGraph() {
    controller.monthTitles = MONTHLY_DATA['x_axis'];

    List<BarChartGroupData> showingBarGroupsMonthly = [];
    for (int index = 0; index <  MONTHLY_DATA['x_axis'].length ; index++)
    {
      showingBarGroupsMonthly.add(
          makeGroupData(
            index,
            MONTHLY_DATA['data'][MONTHLY_DATA["x_axis"][index]]['upper'],
            MONTHLY_DATA['data'][MONTHLY_DATA["x_axis"][index]]['lower'],
          )
      );
    }
    return showTwoLinesLinearGraph(
        context, showingBarGroupsMonthly, MONTHLY_DATA['y_axis_max'],MONTHLY_DATA['y_axis_min'], MONTHLY_DATA['y_axis_interval']);
  }

  showYearlyBPGraph() {
    controller.yearTitles = YEARLY_DATA['x_axis'];
    List<BarChartGroupData> showingBarGroupsYearly = [];
    for (int index = 0; index <  YEARLY_DATA['x_axis'].length ; index++)
    {
      showingBarGroupsYearly.add(
          makeGroupData(
            index,
            YEARLY_DATA['data'][YEARLY_DATA["x_axis"][index]]['upper'],
            YEARLY_DATA['data'][YEARLY_DATA["x_axis"][index]]['lower'],
          )
      );
    }
    return showTwoLinesLinearGraph(
        context, showingBarGroupsYearly,  YEARLY_DATA['y_axis_max'],  YEARLY_DATA['y_axis_min'], YEARLY_DATA['y_axis_interval']);
  }

  Map BP_GRAPH_MAP = {
    "WEEKLY": showWeeklyBPGraph(),
    "MONTHLY": showMonthlyBPGraph(),
    "YEARLY": showYearlyBPGraph(),
  };

  return Obx(() => BP_GRAPH_MAP[controller.dropDownValue[index]]);
}
