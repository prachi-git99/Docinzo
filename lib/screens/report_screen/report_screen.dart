import 'package:doctor/common_widgets/custom_appbar.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/report_screen/add_report_screen.dart';
import 'package:doctor/screens/report_screen/controller/type_record_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../components/responsive_text.dart';
import '../../controllers/report_controller.dart';
import 'controller/labname_controller.dart';
import 'controller/patient_controller.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);

  var controller = Get.put(ReportController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: customAppbar(context, "My Reports"),
      backgroundColor: white,
      floatingActionButton: CircleAvatar(
        radius: size.width * 0.1,
        backgroundColor: secondaryColor,
        child: IconButton(
          icon: Icon(Icons.add, size: size.width * 0.1, color: white),
          onPressed: () {
            PatientController patientController = Get.put(PatientController());
            RecordTypeController recordTypeController =
                Get.put(RecordTypeController());
            LabNameController labNameController = Get.put(LabNameController());
            patientController.setdropDownData();
            recordTypeController.setdropDownData();
            labNameController.setdropDownData();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddReportScreen()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/$noReportsFoundImg",
                fit: BoxFit.contain,
                width: size.width,
                height: size.height * 0.3),
            responsiveText(
                context: context,
                textColor: secondaryColor,
                text: "Add Your First Report",
                fontWeight: FontWeight.w400,
                size: 20.0)
          ],
        ),
      ),
    );
  }
}
