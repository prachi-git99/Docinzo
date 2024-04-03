import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/notification_screen/widgets/show_no_notification_card.dart';
import 'package:intl/intl.dart';

import '../../../components/responsive_text.dart';
import '../../../components/rounded_corner_container.dart';

Widget showNotificationCard(context) {
  var size = MediaQuery.of(context).size;
  var notiData;

  return StreamBuilder(
      stream: firestore
          .collection(usersCollection)
          .doc(currentUser!.uid)
          .collection(notificationCollection)
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        notiData = snapshot.data?.docs;
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            color: primaryColor,
          ));
        } else if (snapshot.data!.docs.isEmpty) {
          return showNoNotification(context);
        } else {
          return Column(
              children: List.generate(
                  notiData.length,
                  (index) => Column(
                        children: [
                          SizedBox(height: containerVerMargin),
                          roundedCornerContainer(
                            color: glassWhite,
                            width: size.width,
                            spread: 4.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                responsiveText(
                                    context: context,
                                    textColor: black,
                                    text: notiData[index]['title'],
                                    fontWeight: FontWeight.w500,
                                    size: 18.0),
                                Row(
                                  children: [
                                    responsiveText(
                                        context: context,
                                        textColor: fontGrey,
                                        text:
                                            "${DateFormat('d MMM yyyy').format((notiData[index]['time'] as Timestamp).toDate())}, ",
                                        fontWeight: FontWeight.w500,
                                        size: 12.0),

                                    // DateFormat('hh:mm a').format(snapshot.get(notiData[index]['time]).toDate())
                                    responsiveText(
                                        context: context,
                                        textColor: fontGrey,
                                        text:
                                            "${DateFormat('hh:mm a').format((notiData[index]['time'] as Timestamp).toDate())}",
                                        fontWeight: FontWeight.w500,
                                        size: 12.0),
                                  ],
                                ),
                                SizedBox(height: containerVerMargin / 2),
                                responsiveText(
                                    context: context,
                                    textColor: black,
                                    text: notiData[index]['body'],
                                    fontWeight: FontWeight.w400,
                                    size: 12.0)
                              ],
                            ),
                            borderRadius: smallBorderRadius,
                            blur: 14.0,
                          ),
                        ],
                      )));
        }
      });
}
