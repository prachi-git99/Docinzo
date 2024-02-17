import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';

import '../../common_widgets/custom_loading_widget.dart';

class LabTestScreen extends StatelessWidget {
  LabTestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: customAppbar(context, "Book Lab Test"),
        backgroundColor: white,
        body: customLoadingWidget(context, comingSoonGif));
  }
}
