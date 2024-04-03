import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/health_record_screen/record_screen/widgets/show_reports_list_card.dart';
import 'package:get/get.dart';

import '../../report_screen/add_report_screen.dart';
import '../../report_screen/controller/labname_controller.dart';
import '../../report_screen/controller/patient_controller.dart';
import '../../report_screen/controller/type_record_controller.dart';
import '../common_widgets/show_floating_button.dart';

class ReportTabScreen extends StatelessWidget {
  ReportTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return gradientBg(
        context: context,
        widget: Stack(
          children: [
            Scaffold(
              backgroundColor: white,
              body: SingleChildScrollView(child: showReportsCardList(context)),
            ),
            showFloatingButton(
                context: context,
                ontap: () {
                  PatientController patientController =
                      Get.put(PatientController());
                  RecordTypeController recordTypeController =
                      Get.put(RecordTypeController());
                  LabNameController labNameController =
                      Get.put(LabNameController());
                  patientController.setdropDownData();
                  recordTypeController.setdropDownData();
                  labNameController.setdropDownData();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddReportScreen()));
                }),
          ],
        ));
  }
}
