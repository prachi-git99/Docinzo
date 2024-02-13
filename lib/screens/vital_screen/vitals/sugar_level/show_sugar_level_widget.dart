import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "package:pie_chart/pie_chart.dart";

import "../../../../common_widgets/show_twoLines_linear_graph.dart";
import "../../../../components/responsive_text.dart";


Map<String,dynamic> DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 240.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "M": {"upper": 120.0, "lower": 80.0},
    "T": {"upper": 110.0, "lower": 80.0},
    "W": {"upper": 0.0, "lower": 0.0},
    "Th": {"upper": 100.0, "lower": 60.0},
    "F": {"upper": 105.0, "lower": 70.0},
    "Sa": {"upper": 0.0, "lower": 0.0},
    "Su": {"upper": 120.0, "lower": 80.0},
  }
};


VitalsController controller = Get.find<VitalsController>();

Widget showSugarLevelWidget(context,index){

  showGraph(dropDownValue) {
    controller.bottomTitleList = DATA['x_axis'];


    List<BarChartGroupData> showingBarGroupsWeekly = [];
    for (int index = 0; index <  DATA['x_axis'].length ; index++)
    {
      showingBarGroupsWeekly.add(
          makeGroupData(
            index,
            DATA['data'][DATA["x_axis"][index]]['upper'],
            DATA['data'][DATA["x_axis"][index]]['lower'],
          )
      );
    }

    return showTwoLinesLinearGraph(context, showingBarGroupsWeekly,
        DATA['y_axis_max'],DATA['y_axis_min'], DATA['y_axis_interval']);
  }


  return Obx(() => showGraph(controller.dropDownValue[index]));

}