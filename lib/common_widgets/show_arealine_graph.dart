import 'package:doctor/common_widgets/show_twoLines_linear_graph.dart';
import 'package:doctor/consts/consts.dart';
import 'package:fl_chart/fl_chart.dart';


List<Color> gradientColors = [
  primaryColor,
  secondaryColor,

];

const style = TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: poppins,
    fontSize: 14.0
);

Widget showAreaLineGraph({context,showDots, lineWidth,pointsList,interval,minY,maxY,showArea}){
var size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: containerVerPadd),
    child: AspectRatio(
      aspectRatio: 1.2,
      child: LineChart(
          LineChartData(
            minY:minY,
            maxY:maxY,
            titlesData: FlTitlesData(
              show: true,
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: size.height * 0.1,
                  getTitlesWidget: controller.bottomTitles,
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: interval,
                  getTitlesWidget: controller.leftTitles,
                  reservedSize:size.width * 0.12,
                ),
              ),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            lineBarsData: [
              LineChartBarData(
                spots: pointsList,
                belowBarData: BarAreaData(
                  show: showArea,
                  gradient: LinearGradient(
                    colors: gradientColors
                        .map((color) => color.withOpacity(0.3))
                        .toList(),
                  ),
                ),
                gradient: LinearGradient(
                  colors: gradientColors,
                ),
                barWidth: lineWidth,
                isCurved: true,
                isStrokeCapRound: true,
                dotData:  FlDotData(
                  show: showDots,
                ),
              ),
            ],
          )
      ),
    ),
  );


}

// Widget bottomTitleWidgets(double value, TitleMeta meta) {
//
//   Widget text;
//
//   final weekTitles = <String>['Mon', 'Tue', 'Wed', 'Thus', 'Fri', 'Sat', 'Sun'];
//   final monthTitles = <String>['Jan', 'Mar', 'May', 'July', 'Sept', 'Nov'];
//   final yearTitles = <String>['2018', '2019', '2020', '2021', '2022', '2023', '2024'];
//
//
//   switch (value.toInt()) {
//     case 1:
//       text = const Text('Mon', style: style);
//       break;
//     case 2:
//       text = const Text('Tue', style: style);
//       break;
//     case 3:
//       text = const Text('Wed', style: style);
//       break;
//     case 4:
//       text = const Text('Thus', style: style);
//       break;
//     case 5:
//       text = const Text('Fri', style: style);
//       break;
//     case 6:
//       text = const Text('Sat', style: style);
//       break;
//     case 7:
//       text = const Text('Sun', style: style);
//       break;
//     default:
//       text = const Text('', style: style);
//       break;
//   }
//
//   return SideTitleWidget(
//     axisSide: meta.axisSide,
//     space: containerVerPadd, //margin top
//     child: text,
//   );
// }
//
// Widget leftTitles(double value, TitleMeta meta) {
//
//   return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 0,
//       child: Text("${value.toInt()}",style: style,)
//   );
// }





