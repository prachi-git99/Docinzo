
import 'package:doctor/consts/consts.dart';
import 'package:fl_chart/fl_chart.dart';


const style = TextStyle(
    color: black,
    fontWeight: FontWeight.w400,
    fontFamily: poppins,
    fontSize: 14.0
);


Widget showSingleLinesLinearGraph(context,showingBarGroups,id,maxLimit,interval){
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
                    getTitlesWidget: bottomTitles,
                    reservedSize: 42,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 28,
                    interval: interval,
                    getTitlesWidget: leftTitles,
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

Widget leftTitles(double value, TitleMeta meta) {

  return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text("${value.toInt()}",style: style,)
  );
}

Widget bottomTitles(double value, TitleMeta meta) {
  final weekTitles = <String>['Mon', 'Tue', 'Wed', 'Thus', 'Fri', 'Sat', 'Sun'];
  final monthTitles = <String>['Jan', 'Mar', 'May', 'July', 'Sept', 'Nov'];
  final yearTitles = <String>['2018', '2019', '2020', '2021', '2022', '2023', '2024'];

  final Widget text = Text(
    weekTitles[value.toInt()],
    // myId==0?weekTitles[value.toInt()]:myId==1?monthTitles[value.toInt()]:myId==2?yearTitles[value.toInt()]:weekTitles[value.toInt()],
    style: style ,
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: containerVerPadd, //margin top
    child: text,
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