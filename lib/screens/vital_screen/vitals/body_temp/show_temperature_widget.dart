import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "package:pie_chart/pie_chart.dart";
import "../../../../common_widgets/show_single_line_linear_graph.dart";
import "../../../../components/responsive_text.dart";


Widget showTemperatureWidget(context,index){

  String Temp = "120/80";
  String dropDownDefault = "WEEKLY";

  showWeeklyGraph() {
    List<BarChartGroupData> showingBarGroupsWeekly = [
      makeGroupData(0, 17),
      makeGroupData(1, 80),
      makeGroupData(2, 90),
      makeGroupData(3, 100),
      makeGroupData(4, 87),
      makeGroupData(5, 76),
      makeGroupData(6, 89),
    ];
    return  showSingleLinesLinearGraph(context,showingBarGroupsWeekly,0,120.0,20.0);
  }

  showMonthlyGraph() {
    List<BarChartGroupData> showingBarGroupsMonthly = [
      makeGroupData(3, 100),
      makeGroupData(4, 87),
      makeGroupData(5, 76),
      makeGroupData(6, 89),
      makeGroupData(0, 17),
      makeGroupData(1, 80),
      makeGroupData(2, 90),
    ];
    return showSingleLinesLinearGraph(context,showingBarGroupsMonthly,1,120.0,20.0);
  }

  showYearlyGraph(){
    List<BarChartGroupData> showingBarGroupsYearly = [
      makeGroupData(0, 17),
      makeGroupData(1, 80),
      makeGroupData(6, 89),
      makeGroupData(2, 90),
      makeGroupData(3, 100),
      makeGroupData(4, 87),
      makeGroupData(5, 76),
    ];
    return showSingleLinesLinearGraph(context,showingBarGroupsYearly,2,120.0,20.0);
  }

  Map GRAPH_MAP = {
    "WEEKLY" :  showWeeklyGraph(),
    "MONTHLY" : showMonthlyGraph(),
    "YEARLY" : showYearlyGraph(),
  };

  var controller = Get.find<VitalsController>();

  return Obx(() =>GRAPH_MAP[controller.dropDownValue[index]]);
}