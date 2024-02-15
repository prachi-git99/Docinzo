import "package:doctor/consts/consts.dart";
import "package:flutter_svg/svg.dart";

import '../components/gradient_rounded_container.dart';
import '../components/responsive_text.dart';

Widget showAppointmentSection({context, width}) {
  var size = MediaQuery.of(context).size;

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
                        color: shadow,
                        spreadRadius: 0,
                        blurRadius: 15.0,
                      ),
                    ]),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/icons/$user"),
                    SizedBox(
                      width: containerHorMargin,
                    ),
                    SizedBox(
                      width: size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          responsiveText(
                              context: context,
                              text: doctorName,
                              textColor: black,
                              fontWeight: FontWeight.w500,
                              size: 14.0),
                          responsiveText(
                              context: context,
                              text: "Physician",
                              textColor: black,
                              fontWeight: FontWeight.w300,
                              size: 12.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: containerVerMargin,
              ),
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
                            text: "Feb 20,2024",
                            textColor: white,
                            fontWeight: FontWeight.w600,
                            size: 14.0),
                        responsiveText(
                            context: context,
                            text: "Monday",
                            textColor: white,
                            fontWeight: FontWeight.w300,
                            size: 12.0),
                      ],
                    ),
                    SizedBox(
                      width: 3 * containerHorMargin,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        responsiveText(
                            context: context,
                            text: "7:00 PM",
                            textColor: white,
                            fontWeight: FontWeight.w600,
                            size: 14.0),
                        responsiveText(
                            context: context,
                            text: "Evening",
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
              onTap: () {},
              child: gradientRoundedContainer(
                  context: context,
                  borderRadius: largeBorderRadius,
                  child: Icon(
                    Icons.call,
                    color: white,
                  ),
                  blur: 12.0),
            ),
          ),
        )
      ],
    ),
  );
}
