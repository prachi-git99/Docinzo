import 'package:doctor/common_widgets/gradient_background.dart';
import 'package:doctor/consts/consts.dart';
import 'package:doctor/screens/health_record_screen/record_screen/widgets/show_reports_list_card.dart';
import 'package:get/get.dart';

import '../../report_screen/add_report_screen.dart';
import '../../report_screen/controller/labname_controller.dart';
import '../../report_screen/controller/patient_controller.dart';
import '../../report_screen/controller/type_record_controller.dart';
import '../common_widgets/show_default_nodata_screen.dart';
import '../common_widgets/show_floating_button.dart';

class ReportTabScreen extends StatelessWidget {
  ReportTabScreen({Key? key}) : super(key: key);

  List<Map<String, dynamic>> reportData = [
    {
      "type": "LAB",
      "pateint_name": "Anuj sharma",
      "created_at": "12-03-2024",
      "lab": {"name": "apollo pvt ltd", "image": ""},
      "file": ["sample1.jpg", "sample2.pdf"]
    },
    {
      "type": "PRESCRIPTION",
      "pateint_name": "Anuj sharma",
      "created_at": "12-03-2024",
      "doctor_name": "Dr. Sheesha Singh",
      "file": ["sample1.jpg", "sample2.pdf"]
    },
    {
      "type": "ELSE",
      "pateint_name": "Krishna verma",
      "created_at": "12-03-2024",
      "doctor_name": "Dr. Sheesha Singh",
      "file": ["sample1.jpg", "sample2.pdf"]
    }
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return gradientBg(
        context: context,
        widget: Scaffold(
          backgroundColor: white,
          body: Stack(
            children: [
              // showReportsList(),
              reportData.length != 0
                  ? showReportsCardList(context, reportData)
                  : showDefaultScreen(context, "Add Your First Report"),
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
          ),
        ));
  }
}
