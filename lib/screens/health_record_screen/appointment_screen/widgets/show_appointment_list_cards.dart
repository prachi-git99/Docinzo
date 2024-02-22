import 'package:doctor/consts/consts.dart';

import '../../../../components/responsive_text.dart';
import '../../../../components/rounded_corner_container.dart';

Widget showAppointmentCardList(context, data) {
  var size = MediaQuery.of(context).size;
  return Column(
      children: List.generate(
          data.length,
          (index) => Padding(
                padding: EdgeInsets.symmetric(
                    vertical: containerVerMargin, horizontal: containerHorPadd),
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
                            child: Icon(
                              Icons.calendar_month_rounded,
                              color: primaryColor,
                              size: size.width * 0.1,
                            )),
                        SizedBox(width: containerVerMargin),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * 0.52,
                              child: responsiveText(
                                  context: context,
                                  textColor: black,
                                  text: "${data[index]['doctor_name']}",
                                  fontWeight: FontWeight.w500,
                                  size: 16.0),
                            ),
                            Container(
                              width: size.width * 0.52,
                              child: responsiveText(
                                  context: context,
                                  textColor: black,
                                  text:
                                      "Patient: ${data[index]['patient_name']}",
                                  fontWeight: FontWeight.w400,
                                  size: 12.0),
                            ),
                            Container(
                              width: size.width * 0.52,
                              child: responsiveText(
                                  context: context,
                                  textColor: black,
                                  text:
                                      "Date: ${data[index]['appointment_date']}",
                                  fontWeight: FontWeight.w400,
                                  size: 12.0),
                            ),
                            Container(
                              width: size.width * 0.52,
                              child: responsiveText(
                                  context: context,
                                  textColor: black,
                                  text:
                                      "Time: ${data[index]['appointment_time']}",
                                  fontWeight: FontWeight.w400,
                                  size: 12.0),
                            ),
                            SizedBox(height: containerVerMargin),
                            roundedCornerContainer(
                              borderRadius: mediumBorderRadius,
                              blur: 12.0,
                              color: data[index]['status'] == "UPCOMING"
                                  ? lightYellow
                                  : lightGreen,
                              child: responsiveText(
                                  context: context,
                                  textColor: black,
                                  text: "${data[index]['status']}",
                                  fontWeight: FontWeight.w500,
                                  size: 12.0),
                            ),
                            SizedBox(height: containerVerMargin),
                          ],
                        ),
                      ],
                    )),
              )));
}
