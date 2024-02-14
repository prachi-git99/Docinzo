import 'dart:io';

import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/report_screen/add_report_screen.dart';
import 'package:doctor/screens/report_screen/widgets/show_upload_file_section.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_loading_widget.dart';
import '../../components/responsive_text.dart';
import '../../controllers/report_controller.dart';


class LabTestScreen extends StatelessWidget {
  LabTestScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppbar(context,"Book Lab Test"),
      backgroundColor: white,
      body: customLoadingWidget(context,comingSoonGif)

    );
  }
}
