import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "package:pie_chart/pie_chart.dart";

import "../../../../common_widgets/show_twoLines_linear_graph.dart";
import "../../../../components/responsive_text.dart";


Widget showBloodPressureWidget(context,index){

  String bp_value = "120/80";
  String dropDownDefault = "WEEKLY";

  showWeeklyBPGraph() {
    List<BarChartGroupData> showingBarGroupsWeekly = [
      makeGroupData(0, 120, 60),
      makeGroupData(1, 100, 80),
      makeGroupData(2, 120, 90),
      makeGroupData(3, 120, 85),
      makeGroupData(4, 125, 79),
      makeGroupData(5, 130, 82),
      makeGroupData(6, 128, 89),
    ];
    return  showTwoLinesLinearGraph(context,showingBarGroupsWeekly,0,300.0,20.0);
  }

  showMonthlyBPGraph() {
    List<BarChartGroupData> showingBarGroupsMonthly = [
      makeGroupData(0, 120, 60),
      makeGroupData(4, 125, 79),
      makeGroupData(5, 130, 82),
      makeGroupData(1, 100, 80),
      makeGroupData(2, 120, 90),
      makeGroupData(3, 120, 85),
      makeGroupData(6, 128, 89),
    ];
    return showTwoLinesLinearGraph(context,showingBarGroupsMonthly,1,300.0,20.0);
  }

  showYearlyBPGraph(){
    List<BarChartGroupData> showingBarGroupsYearly = [
      makeGroupData(3, 120, 85),
      makeGroupData(4, 125, 79),
      makeGroupData(5, 130, 82),
      makeGroupData(0, 120, 60),
      makeGroupData(1, 100, 80),
      makeGroupData(2, 120, 90),
      makeGroupData(6, 128, 89),
    ];
    return showTwoLinesLinearGraph(context,showingBarGroupsYearly,2,300.0,20.0);
  }

  Map BP_GRAPH_MAP = {
    "WEEKLY" :  showWeeklyBPGraph(),
    "MONTHLY" : showMonthlyBPGraph(),
    "YEARLY" : showYearlyBPGraph(),
  };

  var controller = Get.find<VitalsController>();

  return Obx(() =>BP_GRAPH_MAP[controller.dropDownValue[index]]);
}