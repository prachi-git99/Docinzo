import 'package:doctor/common_widgets/show_twoLines_linear_graph.dart';
import 'package:doctor/consts/consts.dart';
import 'package:fl_chart/fl_chart.dart';

List<Color> gradientColors = [primaryColor, secondaryColor];

const style = TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: poppins,
    fontSize: 14.0);

Widget showAreaLineGraph(
    {context,
    showDots,
    lineWidth,
    pointsList,
    interval,
    minY,
    maxY,
    showArea}) {
  var size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: containerVerPadd),
    child: AspectRatio(
      aspectRatio: 1.2,
      child: LineChart(LineChartData(
        minY: minY,
        maxY: maxY,
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
              reservedSize: size.width * 0.12,
            ),
          ),
        ),
        borderData: FlBorderData(show: false),
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
            gradient: LinearGradient(colors: gradientColors),
            barWidth: lineWidth,
            isCurved: true,
            isStrokeCapRound: true,
            dotData: FlDotData(show: showDots),
          ),
        ],
      )),
    ),
  );
}
