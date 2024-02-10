import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/components/reponsive_text.dart';
import 'package:doctor/components/rounded_corner_container.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/vital_screen/widgets/blood_pressure/show_blood_pressure_widget.dart';
import 'package:doctor/screens/vital_screen/widgets/show_BP_widget.dart';
import 'package:doctor/screens/vital_screen/widgets/show_vitalvalues_dropdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../common_widgets/gradient_background.dart';

class VitalScreen extends StatefulWidget {
  const VitalScreen({Key? key}) : super(key: key);

  @override
  State<VitalScreen> createState() => _VitalScreenState();
}

class _VitalScreenState extends State<VitalScreen> {

  List<bool> showVitalInfo = List.generate(myVitalData.length, (index) => false);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        top: true,
        child: Scaffold(
          appBar: customAppbar(context, "My Health Vitals"),
          body: SizedBox(
            height: size.height*0.8,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: myVitalData.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: containerVerMargin),
                        padding: EdgeInsets.symmetric(
                            horizontal: containerHorPadd),
                        child: roundedCornerContainer(
                          width: size.width,
                          color: glassWhite,
                          borderRadius: smallBorderRadius,
                          blur: 12.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/icons/vitals_icons/${myVitalData[index]['image']}",
                                    width: size.width * 0.1,
                                    height: size.height * 0.03,
                                    color: primaryColor,
                                  ),
                                  SizedBox(
                                    width: containerHorMargin,
                                  ),
                                  responsiveText(
                                      context: context,
                                      textColor: black,
                                      text: myVitalData[index]['name'],
                                      fontWeight: FontWeight.w500,
                                      size: 18.0),
                                ],
                              ),
                              IconButton(
                                icon: Icon(
                                  showVitalInfo[index] ? Icons.keyboard_arrow_up :Icons.keyboard_arrow_down,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    showVitalInfo[index] = !showVitalInfo[index];
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      showVitalInfo[index] ? Container(
                        margin: EdgeInsets.only(bottom: 2*containerVerMargin),
                        padding: EdgeInsets.symmetric(
                            horizontal: containerHorPadd),
                        child: roundedCornerContainer(
                          width: size.width,
                          color: glassWhite,
                          borderRadius: smallBorderRadius,
                          blur: 12.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: containerHorPadd,vertical: containerVerPadd),
                            child: Column(
                              children: [
                                showVitalvaluesDropdown(context,index),
                                SizedBox(height: 2 * containerVerMargin,),
                                index == 0 ? showBloodPressureWidget(context, index) : SizedBox.shrink()

                              ],
                            ),
                          ),
                        ),
                      ) : SizedBox.shrink()
                    ],
                  );
                }
            ),
          ),
        ));
  }
}
