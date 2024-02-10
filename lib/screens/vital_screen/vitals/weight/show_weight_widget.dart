import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:fl_chart/fl_chart.dart";
import "package:get/get.dart";
import "../../../../common_widgets/show_arealine_graph.dart";
import "../../../../common_widgets/show_twoLines_linear_graph.dart";


Widget showWeightWidget(context,index){

  String weight = "56";
  String dropDownDefault = "WEEKLY";

  bool showArea = false;


  showWeeklyWeightGraph() {
    List<FlSpot> points =[
      FlSpot(1, 35),
      FlSpot(2, 40),
      FlSpot(3, 45),
      FlSpot(4, 32),
      FlSpot(5, 49),
      FlSpot(6, 51),
      FlSpot(7, 56),
    ];
    return showAreaLineGraph(showDots: true,lineWidth: 0.0,pointsList: points,showArea: showArea);
  }

  showMonthlyWeightGraph() {
    List<FlSpot> points =[
      FlSpot(1, 35),
      FlSpot(2, 42),
      FlSpot(3, 49),
      FlSpot(4, 37),
      FlSpot(5, 40),
      FlSpot(6, 45),
      FlSpot(7, 50),
    ];
    return showAreaLineGraph(showDots: true,lineWidth: 0.0,pointsList: points,showArea: showArea);
  }

  showYearlyWeightGraph(){
    List<FlSpot> points =[
      FlSpot(1, 40),
      FlSpot(2, 45),
      FlSpot(3, 46),
      FlSpot(4, 50),
      FlSpot(5, 52),
      FlSpot(6, 58),
      FlSpot(7, 56),
    ];
    return showAreaLineGraph(showDots: true,lineWidth: 0.0,pointsList: points,showArea:showArea);
  }

  Map WEIGHT_GRAPH_MAP = {
    "WEEKLY" :  showWeeklyWeightGraph(),
    "MONTHLY" : showMonthlyWeightGraph(),
    "YEARLY" : showYearlyWeightGraph(),
  };

  var controller = Get.find<VitalsController>();

  return Obx(() =>WEIGHT_GRAPH_MAP[controller.dropDownValue[index]]);
}