import 'package:doctor/consts/consts.dart';

import '../../common_widgets/custom_loading_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return customLoadingWidget(context,comingSoonGif);
  }
}
