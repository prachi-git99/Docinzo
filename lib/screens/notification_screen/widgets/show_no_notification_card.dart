import 'package:doctor/consts/consts.dart';

import '../../../common_widgets/custom_loading_widget.dart';
import '../../../components/responsive_text.dart';

Widget showNoNotification(context) {
  var size = MediaQuery.of(context).size;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: size.height * 0.1),
      customLoadingWidget(context, "notification.png"),
      responsiveText(
          context: context,
          textColor: black,
          text: "No Notification Yet !!",
          fontWeight: FontWeight.w600,
          size: 18.0),
      Text(
        "You do not have any notifications right now, Please come back later.",
        textAlign: TextAlign.center,
        style: TextStyle(
            color: fontGrey,
            fontFamily: poppins,
            fontSize: 14.0,
            fontWeight: FontWeight.w400),
      ),
    ],
  );
}
