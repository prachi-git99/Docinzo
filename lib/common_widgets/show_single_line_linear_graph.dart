
import 'package:doctor/consts/consts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../controllers/vitals_controller.dart';

var controller = Get.find<VitalsController>();
Widget showSingleLinesLinearGraph(context, showingBarGroups, maxLimit,minLimit, interval){
  var size = MediaQuery.of(context).size;
  return AspectRatio(
    aspectRatio: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: containerVerMargin,
        ),
        Expanded(
          child: BarChart(
            BarChartData(
              maxY: maxLimit,
              minY: minLimit,
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
                    getTitlesWidget: controller.bottomTitles,
                    reservedSize: size.height * 0.1,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize:  size.width * 0.12,
                    interval: interval,
                    getTitlesWidget: controller.leftTitles,
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: showingBarGroups,
              gridData: const FlGridData(show: false),
            ),

          ),
        ),

      ],
    ),
  );
}

BarChartGroupData makeGroupData(int x, double y1) {
  return BarChartGroupData(
    barsSpace: 4,
    x: x,
    barRods: [
      BarChartRodData(
        toY: y1,
        color: primaryColor,
        width: 10,
      ),
    ],
  );
}