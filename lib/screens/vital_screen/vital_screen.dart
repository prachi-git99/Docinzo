import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/components/responsive_text.dart';
import 'package:doctor/components/rounded_corner_container.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/vitals_controller.dart';
import 'package:doctor/screens/vital_screen/widgets/show_vital_less_details.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VitalScreen extends StatefulWidget {
  const VitalScreen({Key? key}) : super(key: key);

  @override
  State<VitalScreen> createState() => _VitalScreenState();
}

class _VitalScreenState extends State<VitalScreen> {
  VitalsController controller = Get.put(VitalsController());

  List<bool> showVitalInfo = List.generate(8, (index) => false);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: customAppbar(context, "Health Vitals"),
      body: SizedBox(
        height: size.height * 0.8,
        child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.myVitalData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: containerVerMargin),
                    padding: EdgeInsets.symmetric(horizontal: containerHorPadd),
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
                                "assets/images/icons/vitals_icons/${controller.myVitalData[index]['image']}",
                                width: size.width * 0.1,
                                height: size.height * 0.03,
                                color: primaryColor,
                              ),
                              SizedBox(width: containerHorMargin),
                              responsiveText(
                                  context: context,
                                  textColor: black,
                                  text: controller.myVitalData[index]['name'],
                                  fontWeight: FontWeight.w500,
                                  size: 18.0),
                            ],
                          ),
                          IconButton(
                            icon: Icon(
                              showVitalInfo[index]
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
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
                  showVitalInfo[index]
                      ? showVitalsLessInfo(context, index)
                      : SizedBox.shrink()
                ],
              );
            }),
      ),
    );
  }
}
