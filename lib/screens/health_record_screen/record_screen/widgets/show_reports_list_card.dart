import 'package:doctor/consts/consts.dart';

import '../../../../components/responsive_text.dart';
import '../../../../components/rounded_corner_container.dart';

Widget showReportsCardList(context, data) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            roundedCornerContainer(
                                height: size.height * 0.1,
                                width: size.width * 0.20,
                                blur: 0.0,
                                color: glassWhite,
                                borderRadius: smallBorderRadius,
                                child: data[index]['type'] == 'LAB'
                                    ? Image.asset("assets/images/apollo.png",
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
                                Container(
                                  width: size.width * 0.52,
                                  child: responsiveText(
                                      context: context,
                                      textColor: black,
                                      text: data[index]['type'] == 'LAB'
                                          ? data[index]['lab']['name']
                                          : data[index]['type'] ==
                                                  'PRESCRIPTION'
                                              ? data[index]['doctor_name']
                                              : "${data[index]['pateint_name']}'s Report",
                                      fontWeight: FontWeight.w500,
                                      size: 16.0),
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
                        ),
                        Icon(
                          Icons.more_vert,
                          color: black,
                        )
                      ],
                    )),
              )));
}
