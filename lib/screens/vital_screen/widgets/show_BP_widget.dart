import 'package:doctor/consts/consts.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';

Widget showBPwidget(context){
  var size = MediaQuery.of(context).size;
  final gradientList = <List<Color>>[
    unselectedPieChartGradient,
    [
      Color.fromRGBO(45, 120, 233, 1),
      Color.fromRGBO(98, 158, 245, 1.0),
    ]
  ];
  return roundedCornerContainer(
      width: size.width,
      color: glassWhite,
      borderRadius: smallBorderRadius,
      blur: 12.0,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                responsiveText(context: context,textColor: black,text: "Blood Pressure",fontWeight: FontWeight.w500,size: 18.0),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios,size: 15,),
                  onPressed: (){},
                )
              ],
            ),

            SizedBox(height: containerVerMargin,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(2, (index) => Container(
                width: size.width*0.4,
                child:PieChart(
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
                  legendOptions: LegendOptions(
                      showLegends: false
                  ),
                ) ,
              )),
            ),
            SizedBox(height: containerVerMargin,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                responsiveText(
                    context: context,
                    text:lastUpdate,
                    textColor: black.withOpacity(0.4),
                    fontWeight: FontWeight.w200,
                    size: 12.0),
                responsiveText(
                    context: context,
                    text:" 2 Feb,24 2:00 PM",
                    textColor: black,
                    fontWeight: FontWeight.w400,
                    size: 12.0),

              ],
            ),
            SizedBox(height: containerVerMargin,),
          ]
      )

  );
}