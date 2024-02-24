import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/record_controller.dart';
import 'package:doctor/screens/health_record_screen/record_screen/widgets/show_bottomSheet.dart';
import 'package:get/get.dart';

import '../../../../components/responsive_text.dart';
import '../../../../components/rounded_corner_container.dart';
import '../../../home_screen/widgets/show_search_widget.dart';

Widget showReportsCardList(context, data) {
  var size = MediaQuery.of(context).size;

  var controller = Get.put(RecordController());

  // var ChipSelected = List.generate(items.length, (index) => false);

  return Container(
    margin: EdgeInsets.only(bottom: 8 * containerVerMargin),
    padding: EdgeInsets.symmetric(
        vertical: containerVerMargin, horizontal: containerHorPadd),
    child: Column(
      children: [
        //search widget
        showSearchWidget(ontap: () {}, context: context),
        //chips for filter
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < controller.items.length; i++)
                Obx(
                  () => Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: containerHorMargin / 2),
                    child: ChoiceChip(
                      padding:
                          EdgeInsets.symmetric(horizontal: containerHorPadd),
                      label: Text(controller.items[i]),
                      backgroundColor: white,
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: secondaryColor),
                          borderRadius:
                              BorderRadius.circular(smallBorderRadius)),
                      elevation: 2,
                      // side: BorderSide(color: primaryBlueColor),
                      selected: controller.ChipSelected[i],
                      selectedColor: secondaryColor,
                      labelStyle: TextStyle(
                          color: controller.ChipSelected[i] == true
                              ? white
                              : primaryColor,
                          fontFamily: poppins,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                      onSelected: (bool value) {
                        controller.ChipSelected[i] = value;
                      },
                    ),
                  ),
                )
            ],
          ),
        ),
        SizedBox(height: containerVerMargin),
        Column(
            children: List.generate(
                data.length,
                (index) => GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (_) {
                              return showBottomSheetWidget(context);
                            });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: containerVerMargin),
                        child: roundedCornerContainer(
                            color: white,
                            spread: 4.0,
                            borderRadius: smallBorderRadius,
                            blur: 12.0,
                            child: Row(
                              children: [
                                roundedCornerContainer(
                                    height: size.height * 0.1,
                                    width: size.width * 0.20,
                                    blur: 0.0,
                                    color: glassWhite,
                                    borderRadius: smallBorderRadius,
                                    child: data[index]['type'] == 'LAB'
                                        ? Image.asset(
                                            "assets/images/apollo.png",
                                            fit: BoxFit.contain)
                                        : Icon(
                                            Icons.file_copy_outlined,
                                            color: primaryColor,
                                            size: size.width * 0.1,
                                          )),
                                SizedBox(width: containerVerMargin),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data[index]['type'] == 'LAB'
                                        ? Container(
                                            width: size.width * 0.52,
                                            child: responsiveText(
                                                context: context,
                                                textColor: black,
                                                text: data[index]
                                                    ['report_name'],
                                                fontWeight: FontWeight.w500,
                                                size: 16.0),
                                          )
                                        : SizedBox.shrink(),
                                    Container(
                                      width: size.width * 0.52,
                                      child: responsiveText(
                                          context: context,
                                          textColor: black,
                                          text: data[index]['type'] == 'LAB'
                                              ? "Lab: ${data[index]['lab']['name']}"
                                              : data[index]['type'] ==
                                                      'PRESCRIPTION'
                                                  ? data[index]['doctor_name']
                                                  : "${data[index]['report_name']}",
                                          fontWeight:
                                              data[index]['type'] == 'LAB'
                                                  ? FontWeight.w400
                                                  : FontWeight.w500,
                                          size: data[index]['type'] == 'LAB'
                                              ? 12.0
                                              : 16.0),
                                    ),
                                    Container(
                                      width: size.width * 0.52,
                                      child: responsiveText(
                                          context: context,
                                          textColor: black,
                                          text:
                                              "Patient: ${data[index]['pateint_name']}",
                                          fontWeight: FontWeight.w400,
                                          size: 12.0),
                                    ),
                                    Container(
                                      width: size.width * 0.52,
                                      child: responsiveText(
                                          context: context,
                                          textColor: black,
                                          text:
                                              "Date: ${data[index]['created_at']}",
                                          fontWeight: FontWeight.w400,
                                          size: 12.0),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ))),
      ],
    ),
  );
}
