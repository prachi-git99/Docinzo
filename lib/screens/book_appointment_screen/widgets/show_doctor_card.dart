import 'package:doctor/consts/consts.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';

Widget showDoctorCard(context, doctorsList) {
  // Map<String, dynamic> doctorsList = {
  //   "id": 0,
  //   "name": "Dr.Prachi Sharma",
  //   "speciality": "Cardiologist",
  //   "exp": 19,
  //   "degree": ["MBBS", "MD"]
  // };
  var size = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: containerHorPadd / 2, vertical: containerVerPadd),
    margin: EdgeInsets.symmetric(vertical: containerVerMargin / 2),
    child: roundedCornerContainer(
        color: glassWhite,
        borderRadius: smallBorderRadius,
        blur: 12.0,
        spread: 0.0,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: primaryColor,
              radius: size.width * 0.08,
              child: SvgPicture.asset("assets/images/icons/$user",
                  color: Colors.white),
            ),
            SizedBox(width: containerHorMargin),
            //user info
            Container(
              width: size.width * 0.52,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  responsiveText(
                      context: context,
                      text: doctorsList['name'],
                      textColor: black,
                      fontWeight: FontWeight.w500,
                      size: 18.0),
                  responsiveText(
                      context: context,
                      text: doctorsList['speciality'],
                      textColor: black,
                      fontWeight: FontWeight.w500,
                      size: 12.0),
                  Row(
                      children: List.generate(
                    doctorsList['degree'].length,
                    (i) => responsiveText(
                        context: context,
                        text: "${doctorsList['degree'][i]}, ",
                        textColor: black,
                        fontWeight: FontWeight.w500,
                        size: 12.0),
                  )),
                  responsiveText(
                      context: context,
                      text: "${doctorsList['exp']} years Exp",
                      textColor: black,
                      fontWeight: FontWeight.w500,
                      size: 12.0),
                ],
              ),
            ),
          ],
        )),
  );
}
