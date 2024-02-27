import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/notification_screen/widgets/show_no_notification_card.dart';
import 'package:doctor/screens/notification_screen/widgets/show_notofication_card.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/gradient_background.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int index = 0;
    return Scaffold(
      appBar: customAppbar(context, "Notifications"),
      body: gradientBg(
          context: context,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: appHorizontalPadding,
                  vertical: appVerticalPadding),
              child: index == 0
                  ? showNoNotification(context)
                  : showNotificationCard(context),
            ),
          )),
    );
  }
}
