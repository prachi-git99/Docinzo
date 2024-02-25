import 'package:doctor/common_widgets/custom_botton_widget.dart';
import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/common_widgets/show_appointment_section.dart';
import 'package:doctor/components/dynamic_gradient_rounded_container.dart';
import 'package:doctor/components/responsive_text.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/home_controller.dart';
import 'package:doctor/screens/health_history_screens/health_history_screen.dart';
import 'package:doctor/screens/home_screen/widgets/show_header_widget.dart';
import 'package:doctor/screens/home_screen/widgets/show_health_tracker_section.dart';
import 'package:doctor/screens/home_screen/widgets/show_search_widget.dart';
import 'package:doctor/screens/home_screen/widgets/show_service_section.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return gradientBg(
        context: context,
        widget: SafeArea(
          top: true,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: appHorizontalPadding,
                  vertical: appVerticalPadding),
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
                  SizedBox(height: containerVerMargin),
                  showServicesSection(context),
                  //appointment
                  SizedBox(height: 2 * containerVerMargin),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      responsiveText(
                          context: context,
                          text: appointmentSectionTitle,
                          textColor: black,
                          fontWeight: FontWeight.w500,
                          size: 18.0)
                    ],
                  ),
                  //show appointment section
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    child: Row(
                        children: List.generate(
                            3,
                            (index) => showAppointmentSection(
                                context: context, width: size.width * 0.8))),
                  ),
                  //health section
                  SizedBox(height: 2 * containerVerMargin),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      responsiveText(
                          context: context,
                          text: trackerSectionTitle,
                          textColor: black,
                          fontWeight: FontWeight.w500,
                          size: 18.0),
                      GestureDetector(
                          onTap: () {
                            var controller = Get.find<HomeController>();
                            controller.currentNavIndex.value = 2;
                          },
                          child: responsiveText(
                              context: context,
                              text: viewAll,
                              textColor: black,
                              fontWeight: FontWeight.w300,
                              size: 12.0)),
                    ],
                  ),
                  SizedBox(height: containerVerMargin),
                  showHealthTrackerSection(context),
                  SizedBox(height: containerVerMargin),

                  //show general health form
                  dynamicGradientRoundedContainer(
                      context: context,
                      gradient: themeGradient,
                      borderRadius: smallBorderRadius,
                      width: size.width,
                      blur: 12.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            responsiveText(
                                context: context,
                                text: healthHistory,
                                textColor: primaryColor,
                                fontWeight: FontWeight.w600,
                                size: 18.0),
                            responsiveText(
                                context: context,
                                text: healthHistoryDesc,
                                textColor: darkfontGrey,
                                fontWeight: FontWeight.w400,
                                size: 14.0),
                            Image.asset("assets/images/$healthHistoryImg"),
                            customButtonWidget(context, "Add +", white, 16.0,
                                () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HealthHistory()));
                            })
                          ],
                        ),
                      )),
                  SizedBox(height: 10 * containerVerMargin)
                ],
              ),
            ),
          ),
        ));
  }
}
