import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/home_screen/widgets/show_search_widget.dart';
import 'package:intl/intl.dart';

import '../../../../components/responsive_text.dart';
import '../../../../components/rounded_corner_container.dart';
import '../../common_widgets/show_default_nodata_screen.dart';

Widget showAppointmentCardList(context) {
  var size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(bottom: 8 * containerVerMargin),
    padding: EdgeInsets.symmetric(
        vertical: containerVerMargin, horizontal: containerHorPadd),
    child: Column(
      children: [
        showSearchWidget(ontap: () {}, context: context),
        StreamBuilder(
            stream: firestore
                .collection(usersCollection)
                .doc(currentUser!.uid)
                .collection(appointmentCollection)
                .orderBy("date_time", descending: false)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              var data = snapshot.data?.docs;

              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(color: primaryColor));
              } else if (snapshot.data!.docs.isEmpty) {
                return showDefaultScreen(
                    context, "Book Your First Appointment");
              } else {
                return Column(
                    children: List.generate(
                        data!.length,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: containerVerMargin,
                                  horizontal: containerHorPadd),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width * 0.52,
                                            child: responsiveText(
                                                context: context,
                                                textColor: black,
                                                text:
                                                    "${data[index]['doctor_name']}",
                                                fontWeight: FontWeight.w500,
                                                size: 16.0),
                                          ),
                                          // Container(
                                          //   width: size.width * 0.52,
                                          //   child: responsiveText(
                                          //       context: context,
                                          //       textColor: black,
                                          //       text:
                                          //           "Patient: {data[index]['patient_name']}",
                                          //       fontWeight: FontWeight.w400,
                                          //       size: 12.0),
                                          // ),
                                          Container(
                                            width: size.width * 0.52,
                                            child: responsiveText(
                                                context: context,
                                                textColor: black,
                                                text:
                                                    "Date: ${DateFormat('d MMM yyyy').format((data[index]['date_time'] as Timestamp).toDate())}",
                                                fontWeight: FontWeight.w400,
                                                size: 12.0),
                                          ),
                                          Container(
                                            width: size.width * 0.52,
                                            child: responsiveText(
                                                context: context,
                                                textColor: black,
                                                text:
                                                    "Time: ${DateFormat('hh:mm a').format((data[index]['date_time'] as Timestamp).toDate())}",
                                                fontWeight: FontWeight.w400,
                                                size: 12.0),
                                          ),
                                          SizedBox(height: containerVerMargin),
                                          roundedCornerContainer(
                                            borderRadius: mediumBorderRadius,
                                            blur: 12.0,
                                            color: DateTime.parse((data[index]
                                                                ['date_time']
                                                            as Timestamp)
                                                        .toDate()
                                                        .toString())
                                                    .isBefore(DateTime.now())
                                                ? lightYellow
                                                : lightGreen,
                                            child: responsiveText(
                                                context: context,
                                                textColor: black,
                                                text: DateTime.parse((data[
                                                                        index][
                                                                    'date_time']
                                                                as Timestamp)
                                                            .toDate()
                                                            .toString())
                                                        .isBefore(
                                                            DateTime.now())
                                                    ? "DONE"
                                                    : "UPCOMING",
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
            }),
      ],
    ),
  );
}
