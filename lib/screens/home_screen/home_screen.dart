import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/common_widgets/show_appointment_section.dart';
import 'package:doctor/components/responsive_text.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/controllers/home_controller.dart';
import 'package:doctor/screens/home_screen/widgets/show_header_widget.dart';
import 'package:doctor/screens/home_screen/widgets/show_health_history_section.dart';
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
                  SizedBox(height: containerVerMargin),

                  //show appointment section
                  StreamBuilder(
                      stream: firestore
                          .collection(usersCollection)
                          .doc(currentUser!.uid)
                          .collection(appointmentCollection)
                          .orderBy("date_time", descending: false)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        var appointmentData = snapshot.data?.docs;

                        if (!snapshot.hasData) {
                          return SizedBox.shrink();
                        } else if (snapshot.data!.docs.isEmpty) {
                          return SizedBox.shrink();
                        } else {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DateTime.parse((appointmentData
                                                      ?.last['date_time']
                                                  as Timestamp)
                                              .toDate()
                                              .toString())
                                          .isBefore(DateTime.now())
                                      ? SizedBox.shrink()
                                      : responsiveText(
                                          context: context,
                                          text: appointmentSectionTitle,
                                          textColor: black,
                                          fontWeight: FontWeight.w500,
                                          size: 18.0)
                                ],
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: ScrollPhysics(),
                                child: Row(
                                    children: List.generate(
                                        appointmentData!.length,
                                        (index) => DateTime.parse(
                                                    (appointmentData[index]
                                                                ['date_time']
                                                            as Timestamp)
                                                        .toDate()
                                                        .toString())
                                                .isBefore(DateTime.now())
                                            ? SizedBox.shrink()
                                            : showAppointmentSection(
                                                context: context,
                                                width: size.width * 0.8,
                                                data: appointmentData[index]))),
                              ),
                            ],
                          );
                        }
                      }),
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
                            var controller = Get.put(HomeController());
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
                  showHealtyHistorySection(context),
                ],
              ),
            ),
          ),
        ));
  }
}
