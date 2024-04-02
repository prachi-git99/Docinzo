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
      "pateint_name": "Santi sharma",
      "created_at": "12-03-2024",
      "report_name": "X-ray",
      "lab": {"name": "Apollo pvt ltd", "image": ""},
      "file": [
        {
          "type": "image",
          "link":
              "https://m.media-amazon.com/images/I/71v2-pt1EdL._AC_UF1000,1000_QL80_.jpg"
        },
        {
          "type": "image",
          "link":
              "https://m.media-amazon.com/images/I/71v2-pt1EdL._AC_UF1000,1000_QL80_.jpg"
        },
        {
          "type": "document",
          "link":
              "https://drive.google.com/file/d/1vEq9y1D6oMmoYI_O-tBynr9azderbLOP/view"
        }
      ]
    },
    // {
    //   "type": "PRESCRIPTION",
    //   "pateint_name": "Santi sharma",
    //   "created_at": "12-03-2024",
    //   "doctor_name": "Dr. Sheesha Singh",
    //   "file": [
    //     {
    //       "type": "image",
    //       "link":
    //           "https://m.media-amazon.com/images/I/71v2-pt1EdL._AC_UF1000,1000_QL80_.jpg"
    //     },
    //     {
    //       "type": "image",
    //       "link":
    //           "https://m.media-amazon.com/images/I/71v2-pt1EdL._AC_UF1000,1000_QL80_.jpg"
    //     },
    //     {
    //       "type": "document",
    //       "link":
    //           "https://drive.google.com/file/d/1vEq9y1D6oMmoYI_O-tBynr9azderbLOP/view"
    //     }
    //   ]
    // },
    // {
    //   "type": "PRESCRIPTION",
    //   "pateint_name": "Santi sharma",
    //   "created_at": "12-03-2024",
    //   "doctor_name": "Dr. Sheesha Singh",
    //   "file": [
    //     {
    //       "type": "image",
    //       "link":
    //           "https://m.media-amazon.com/images/I/71v2-pt1EdL._AC_UF1000,1000_QL80_.jpg"
    //     },
    //     {
    //       "type": "image",
    //       "link":
    //           "https://m.media-amazon.com/images/I/71v2-pt1EdL._AC_UF1000,1000_QL80_.jpg"
    //     },
    //     {
    //       "type": "document",
    //       "link":
    //           "https://drive.google.com/file/d/1vEq9y1D6oMmoYI_O-tBynr9azderbLOP/view"
    //     }
    //   ]
    // }
  ];

  @override
  Widget build(BuildContext context) {
    return gradientBg(
        context: context,
        widget: Stack(
          children: [
            Scaffold(
              backgroundColor: white,
              body: SingleChildScrollView(
                child: reportData.length != 0
                    ? showReportsCardList(context, reportData)
                    : showDefaultScreen(context, "Add Your First Report"),
              ),
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
