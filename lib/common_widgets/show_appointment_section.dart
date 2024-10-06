import 'package:cloud_firestore/cloud_firestore.dart';
import "package:doctor/consts/consts.dart";
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import "package:flutter_svg/svg.dart";
import 'package:intl/intl.dart';

import '../components/gradient_rounded_container.dart';
import '../components/responsive_text.dart';

Widget showAppointmentSection({context, width, data}) {
  var size = MediaQuery.of(context).size;
  var hours = DateFormat('a')
      .format((data['date_time'] as Timestamp).toDate())
      .toString();

  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: containerHorMargin / 2, vertical: containerVerMargin),
    child: Stack(
      children: [
        gradientRoundedContainer(
          //blue container
          context: context,
          borderRadius: smallBorderRadius,
          width: width,
          blur: 12.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.6,
                padding: EdgeInsets.symmetric(
                    horizontal: containerHorPadd, vertical: containerVerPadd),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(mediumBorderRadius),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: shadow, spreadRadius: 0, blurRadius: 15.0)
                    ]),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/icons/$user"),
                    SizedBox(width: containerHorMargin),
                    SizedBox(
                      width: size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          responsiveText(
                              context: context,
                              text: data['doctor_name'],
                              textColor: black,
                              fontWeight: FontWeight.w500,
                              size: 14.0),
                          responsiveText(
                              context: context,
                              text: data['doctor_speciality'],
                              textColor: black,
                              fontWeight: FontWeight.w300,
                              size: 12.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: containerVerMargin),
              Container(
                padding: EdgeInsets.only(
                    left: containerHorPadd, bottom: containerVerPadd),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        responsiveText(
                            context: context,
                            text:
                                "${DateFormat('d MMM yyyy').format((data['date_time'] as Timestamp).toDate())}",
                            textColor: white,
                            fontWeight: FontWeight.w600,
                            size: 14.0),
                        responsiveText(
                            context: context,
                            text:
                                "${DateFormat('EEEE').format((data['date_time'] as Timestamp).toDate())}",
                            textColor: white,
                            fontWeight: FontWeight.w300,
                            size: 12.0),
                      ],
                    ),
                    SizedBox(width: 3 * containerHorMargin),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        responsiveText(
                            context: context,
                            text:
                                "${DateFormat('hh:mm a').format((data['date_time'] as Timestamp).toDate())}",
                            textColor: white,
                            fontWeight: FontWeight.w600,
                            size: 14.0),
                        responsiveText(
                            context: context,
                            text: (hours == 'AM') ? "Morning" : "Evening",
                            textColor: white,
                            fontWeight: FontWeight.w300,
                            size: 12.0),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          //call button
          right: -8,
          bottom: -8,
          child: CircleAvatar(
            backgroundColor: white,
            radius: size.height * 0.04,
            child: GestureDetector(
              onTap: () {
                FlutterPhoneDirectCaller.callNumber("${data['doctor_phone']}");
                print(data['doctor_phone']);
              },
              child: gradientRoundedContainer(
                  context: context,
                  borderRadius: largeBorderRadius,
                  child: Icon(Icons.call, color: white),
                  blur: 12.0),
            ),
          ),
        )
      ],
    ),
  );
}
