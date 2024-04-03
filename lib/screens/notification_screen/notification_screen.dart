import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/notification_screen/widgets/show_notofication_card.dart';

import '../../common_widgets/custom_appbar.dart';
import '../../common_widgets/gradient_background.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, "Notifications"),
      body: gradientBg(
          context: context,
          widget: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: appHorizontalPadding,
                  vertical: appVerticalPadding),
              child: showNotificationCard(context),
            ),
          )),
    );
  }
}
