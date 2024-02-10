import 'dart:math';

import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/components/gradient_rounded_container.dart';
import 'package:doctor/components/reponsive_text.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/home_screen/widgets/show_appointment_section.dart';
import 'package:doctor/screens/home_screen/widgets/show_header_widget.dart';
import 'package:doctor/screens/home_screen/widgets/show_health_tracker_section.dart';
import 'package:doctor/screens/home_screen/widgets/show_search_widget.dart';
import 'package:doctor/screens/home_screen/widgets/show_service_section.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return gradientBg(
        context: context,
        widget: SafeArea(
          top: true,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //intro
                showHeaderWidget(context),
                //search section
                showSearchWidget(ontap: () {}, context: context),
                //service section
                responsiveText(
                    context: context,
                    text: serviceSectionTitle,
                    textColor: black,
                    fontWeight: FontWeight.w500,
                    size: 18.0),
                SizedBox(
                  height: containerVerMargin,
                ),
                showServicesSection(context),
                //health section
                SizedBox(
                  height: 2*containerVerMargin,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    responsiveText(
                        context: context,
                        text: trackerSectionTitle,
                        textColor: black,
                        fontWeight: FontWeight.w500,
                        size: 18.0),
                    responsiveText(
                        context: context,
                        text: viewAll,
                        textColor: black,
                        fontWeight: FontWeight.w300,
                        size: 12.0),
                  ],
                ),
                SizedBox(
                  height: containerVerMargin,
                ),
                showHealthTrackerSection(context),
                SizedBox(
                  height: 2*containerVerMargin,
                ),
                //appointment
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    responsiveText(
                        context: context,
                        text: appointmentSectionTitle,
                        textColor: black,
                        fontWeight: FontWeight.w500,
                        size: 18.0),
                    responsiveText(
                        context: context,
                        text: viewAll,
                        textColor: black,
                        fontWeight: FontWeight.w300,
                        size: 12.0),
                  ],
                ),
                SizedBox(height: containerVerMargin,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  child: Row(
                      children: List.generate(3,
                          (index) => showAppointmentSection(context: context))),
                ),
                SizedBox(height: 10*containerVerMargin,),
              ],
            ),
          ),
        ));
  }
}
