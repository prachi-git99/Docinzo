import 'package:doctor/consts/consts.dart';

import '../../common_widgets/gradient_background.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return gradientBg(
        context:context,
        widget:Container()
    );
  }
}
