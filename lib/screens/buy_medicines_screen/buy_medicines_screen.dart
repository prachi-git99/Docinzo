import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';

import '../../common_widgets/custom_loading_widget.dart';

class MedicineScreen extends StatelessWidget {
  MedicineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: customAppbar(context, "Buy Medicine"),
        backgroundColor: white,
        body: customLoadingWidget(context, comingSoonGif));
  }
}
