import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "package:pie_chart/pie_chart.dart";
import "../../../../common_widgets/show_single_line_linear_graph.dart";
import "../../../../components/responsive_text.dart";

Map<String,dynamic> DATA = {
  "x_axis": ['M', 'T', 'W', 'Th', 'F', 'Sa', 'Su'],
  "y_axis_max": 160.0,
  "y_axis_min": 20.0,
  "y_axis_interval": 20.0,
  "data": {
    "M": {"value": 70.0},
    "T": {"value": 80.0},
    "W": {"value": 85.0},
    "Th": {"value": 87.0},
    "F": {"value": 70.0},
    "Sa": {"value": 85.0},
    "Su": {"value": 80.0},
  }
};


VitalsController controller = Get.find<VitalsController>();

Widget showTemperatureWidget(context,index){

  showGraph(dropDownValue) {
    controller.bottomTitleList = DATA['x_axis'];


    List<BarChartGroupData> showingBarGroupsWeekly = [];
    for (int index = 0; index <  DATA['x_axis'].length ; index++)
    {
      showingBarGroupsWeekly.add(
          makeGroupData(
            index,
            DATA['data'][DATA["x_axis"][index]]['value'],
          )
      );
    }

    return showSingleLinesLinearGraph(context, showingBarGroupsWeekly,
        DATA['y_axis_max'],DATA['y_axis_min'], DATA['y_axis_interval']);
  }

  return Obx(() => showGraph(controller.dropDownValue[index]));

}