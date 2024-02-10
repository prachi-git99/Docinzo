import "dart:ffi";

import "package:doctor/consts/consts.dart";
import "package:doctor/controllers/vitals_controller.dart";
import "package:get/get.dart";
import "package:pie_chart/pie_chart.dart";

import "../../../../components/responsive_text.dart";


Widget showBloodPressureWidget(context,index){

  String bp_value = "120/80";
  String dropDownDefault = "WEEKLY";

  final gradientList = <List<Color>>[
    unselectedPieChartGradient,
    [
      primaryColor,
      secondaryColor,
    ]
  ];

  showWeeklyBPGraph(context) {
    return PieChart(
      dataMap: bloodPressureDataMap[index],
      gradientList: gradientList,
      ringStrokeWidth:14.0,
      chartType: ChartType.ring,
      centerWidget: Column(
        children: [
          responsiveText(context: context,textColor: black,text: bpTitle[index],fontWeight: FontWeight.w500,size: 18.0),
          responsiveText(context: context,textColor: black,text:bloodPressureDataMap[index]['value'].toString(),fontWeight: FontWeight.w500,size: 18.0),
        ],
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: false,
      ),
    );
  }
  showMonthlyBPGraph() {
    return PieChart(
      dataMap: bloodPressureDataMap[index],
      gradientList: gradientList,
      ringStrokeWidth:14.0,
      chartType: ChartType.ring,
      centerWidget: Column(
        children: [
          responsiveText(context: context,textColor: primaryColor,text: bpTitle[index],fontWeight: FontWeight.w500,size: 18.0),
          responsiveText(context: context,textColor: primaryColor,text:bloodPressureDataMap[index]['value'].toString(),fontWeight: FontWeight.w500,size: 18.0),
        ],
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: false,
      ),
    );
  }
  showYearlyBPGraph(){
    return PieChart(
      dataMap: bloodPressureDataMap[index],
      gradientList: gradientList,
      ringStrokeWidth:14.0,
      chartType: ChartType.ring,
      centerWidget: Column(
        children: [
          responsiveText(context: context,textColor: Colors.pink,text: bpTitle[index],fontWeight: FontWeight.w500,size: 18.0),
          responsiveText(context: context,textColor: Colors.pink,text:bloodPressureDataMap[index]['value'].toString(),fontWeight: FontWeight.w500,size: 18.0),
        ],
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: false,
      ),
    );
  }

  Map BP_GRAPH_MAP = {
    "WEEKLY" :  showWeeklyBPGraph(context),
    "MONTHLY" : showMonthlyBPGraph(),
    "YEARLY" : showYearlyBPGraph(),
  };

  var controller = Get.find<VitalsController>();

  return Obx(() =>BP_GRAPH_MAP[controller.dropDownValue[index]]);
}