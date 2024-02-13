import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import '../consts/consts.dart';
import '../consts/lists.dart';
class VitalsController extends GetxController{

  var myVitalData = [
    {"name":"Blood Pressure","image":icBp,"value":"--/--","unit":"mmHg","date":"No data"},
    {"name":"Weight","image":icweight,"value":"--","unit":"Kg","date":"No data"},
    {"name":"Pulse Rate","image":icpulse,"value":"--","unit":"bpm","date":"No data"},
    {"name":"Blood Sugar Level","image":icsugar,"value":"--","unit":"mg/dL","date":"No data"},
    {"name":"Body Temperature","image":ictemp,"value":"--","unit":"F","date":"No data"},
    {"name":"Oxygen Saturation","image":icoxygen,"value":"--","unit":"SpO","date":"No data"},
    {"name":"Height","image":icheight,"value":"--","unit":"cm","date":"No data"},
    {"name":"Menstrual Cycle","image":icperiod,"value":"--","unit":"days","date":"No data"},
  ];


  var dropDownValue = List.generate(8, (index)=>"WEEKLY").obs;

  final dropDownList =  List.generate(8, (index) => [
      "WEEKLY",
      "MONTHLY",
      "YEARLY",
  ]);


  List<String> bottomTitleList = [];



  var style = TextStyle(
      color: black,
      fontWeight: FontWeight.w400,
      fontFamily: poppins,
      fontSize: 14.0);

  Widget leftTitles(double value, TitleMeta meta) {
    
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: containerHorPadd,
        child: Text(
          "${value.toInt()}",
          style: style,
        ));
  }

  Widget bottomTitles(double value, TitleMeta meta) {

    final Widget text = Text(
      bottomTitleList[value.toInt()],
      style: style,
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: containerVerPadd, //margin top
      child: text,
    );
  }

  void setSelected(String value,index){
    dropDownValue[index] = value;
  }





}